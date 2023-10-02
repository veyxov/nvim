local M = {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
}

M.dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
}

function M.config()
    local luasnip = require 'luasnip'
    local cmp = require 'cmp'

    -- Load copilot-cmp before cmp loads
    ---@diagnostic disable-next-line: undefined-field
    require('lazy').load { plugins = { 'copilot.lua', 'copilot-cmp' } }

    local cmp_acccept_function = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.confirm { select = true }
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { 'i', 's' })

    ---@diagnostic disable-next-line: redundant-parameter
    cmp.setup {
        completion = {
            completeopt = 'menu,menuone,preview',
        },
        snippet = {
            expand = function(args) require('luasnip').lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert {
            ['<Tab>'] = cmp_acccept_function,
            ['<Right>'] = cmp_acccept_function,
            ['<C-q>'] = cmp.mapping.close(),
        },
        sources = cmp.config.sources {
            { name = 'copilot',  group_index = 2 },
            { name = 'nvim_lsp', keyword_length = 2 },
            { name = 'luasnip' },
            {
                name = 'buffer',
                keyword_length = 3,
                option = {
                    get_bufnrs = function()
                        local bufs = {}
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            bufs[vim.api.nvim_win_get_buf(win)] = true
                        end
                        return vim.tbl_keys(bufs)
                    end,
                },
            },
            { name = 'path' },
        },
    }
end

return M

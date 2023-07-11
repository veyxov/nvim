local M = {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
}

M.dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
}

function M.config()
    local luasnip = require 'luasnip'
    local cmp = require 'cmp'

    -- Load copilot-cmp before cmp loads
    require('lazy').load { plugins = { 'copilot-cmp' } }
    local lspkind = require 'lspkind'

    ---@diagnostic disable-next-line: redundant-parameter
    cmp.setup {
        formatting = {
            format = lspkind.cmp_format {
                mode = 'symbol', -- show only symbol annotations
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                symbol_map = {
                    Copilot = '', -- NOTE: depends on copilot
                },
            },
        },
        cospletion = {
            completeopt = 'menu,menuone,preview',
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm { select = true }
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<C-q>'] = cmp.mapping.close(),
        },
        sources = cmp.config.sources {
            { name = 'copilot', group_index = 2 },
            { name = 'nvim_lsp', keyword_length = 3 },
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

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' },
        },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })
end

return M

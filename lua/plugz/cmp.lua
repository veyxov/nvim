local M = {
    "hrsh7th/nvim-cmp",
}

M.dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
}

M.keys = { {
    '<tab>',
    function() -- Load cmp and remove redundant tab that is inserted with the <tab> keymap
        local tab_bs = vim.api.nvim_replace_termcodes('<tab><bs>', true, true, true)
        local esc = vim.api.nvim_replace_termcodes('<esc>a', true, true, true)
        vim.api.nvim_feedkeys(tab_bs, 'i', false)
        vim.api.nvim_feedkeys(esc, 'i', false)
        require 'lazy'.load { plugins = { "nvim-cmp" } }
        vim.keymap.del('i', '<tab>')
    end,
    mode = 'i'
} }

function M.config()
    local luasnip = require 'luasnip'
    local cmp = require 'cmp'

    ---@diagnostic disable-next-line: redundant-parameter
    cmp.setup {
        completion = {
            completeopt = "menu,menuone,preview",
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-q>"] = cmp.mapping.close(),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            {
                name = 'buffer',
                option = {
                    get_bufnrs = function()
                        local bufs = {}
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            bufs[vim.api.nvim_win_get_buf(win)] = true
                        end
                        return vim.tbl_keys(bufs)
                    end
                }
            }
        }),
    }
end

return M

local lspkind = require('lspkind')
local cmp = require'cmp'
local luasnip = require "luasnip"

cmp.setup({
    -- Lspkind
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            before = function (_, vim_item)
                return vim_item
            end
        })
    },
    completion = {
        completeopt = "menu,menuone,noselect",
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-Up>"] = cmp.mapping.select_prev_item(),
        ["<C-Down>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-Down>", true, true, true), "n")
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end,
    },

    sources = {
        { name = "nvim_lsp" },
        { name = 'nvim_lua' },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "calc" },
        { name = "nvim_lua" },
        -- {
        --     name = 'tmux',
        --     option = {
        --         all_panes = true
        --     }
        -- },
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),

    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

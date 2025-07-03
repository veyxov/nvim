return {
    'saghen/blink.cmp',
    dependencies = {
        {
            'Exafunction/windsurf.nvim',
            lazy = false,
            config = function()
                require ('codeium').setup({
                enable_cmp_source = false,
                -- this is 
                virtual_text = {
                    enabled = true,

                    map_keys = true,
                    accept_fallback = nil,
                    key_bindings = {
                        -- Accept the current completion.
                        accept = "<Tab>",
                        -- Accept the next word.
                        accept_word = false,
                        -- Accept the next line.
                        accept_line = false,
                        -- Clear the virtual text.
                        clear = false,
                        -- Cycle to the next completion.
                        next = "<M-]>",
                        -- Cycle to the previous completion.
                        prev = "<M-[>",
                    }
                }

            })
            end
        },
    },

    event = 'InsertEnter',
    version = '1.*',
    opts = {
        keymap = {
            preset = 'none',

            ['<Right>'] = { function(cmp) cmp.accept() end },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },
        signature = { enabled = true },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        providers = {
            codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        },
    },
}

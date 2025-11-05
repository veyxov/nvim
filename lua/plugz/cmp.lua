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
        enabled = function()
            local path = vim.api.nvim_buf_get_name(0)
            if string.find(path, "oil://", 1, true) == 1 then
              return false
            end
            return true
          end,
        signature = { enabled = true },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
            per_filetype = {
                sql = { 'snippets', 'dadbod', 'buffer' },
            },
            providers = {
                codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            },
        },
    },
}

return {
    'saghen/blink.cmp',
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
        fuzzy = { implementation = "prefer_rust_with_warning" },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            per_filetype = {
                sql = { 'snippets', 'dadbod', 'buffer' },
            },
            providers = {
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            },
        },
    },
}

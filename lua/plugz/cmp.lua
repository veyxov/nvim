return {
    'saghen/blink.cmp',

    event = 'InsertEnter',
    version = '*',
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
    },
}

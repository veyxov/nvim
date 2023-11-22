local M = {
    'stevearc/oil.nvim',
    keys = {
        {
            '+',
            function() require('oil').open() end,
        },
        {
            '-',
            function() require('oil').open_float() end,
        },
    },
    opts = {
        skip_confirm_for_simple_edits = true,
        keymaps = {
            ['<C-h>'] = 'actions.close',
            ['e'] = '<Down>',
            ['i'] = '<Up>',
            ['n'] = 'actions.select',
        },
    },
}

return M

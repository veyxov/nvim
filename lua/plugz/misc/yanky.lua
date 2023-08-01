local nx = { 'n', 'x' }

return {
    'gbprod/yanky.nvim',
    keys = {
        {
            'h',
            '<Plug>(YankyYank)',
            mode = nx,
        },
        {
            'hh',
            'yy',
            mode = nx,
        },
        {
            '<leader>h',
            '"+y',
            mode = nx,
        },
        {
            '<leader>hh',
            '"+yy',
            mode = nx,
        },
        {
            'p',
            '<Plug>(YankyPutAfter)',
            mode = nx,
        },
        {
            'P',
            '<Plug>(YankyPutBefore)',
            mode = nx,
        },
        {
            'hn',
            '<Plug>(YankyCycleForward)',
            mode = nx,
        },
        {
            'hp',
            '<Plug>(YankyCycleBackward)',
            mode = nx,
        },
    },
    config = function()
        require('yanky').setup {
            ring = {
                history_length = 100,
                storage = 'shada',
                sync_with_numbered_registers = false,
                cancel_event = 'update',
            },
            picker = {
                select = {
                    action = nil, -- nil to use default put action
                },
                telescope = {
                    use_default_mappings = true, -- if default mappings should be used
                    mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
                },
            },
            system_clipboard = {
                sync_with_ring = true,
            },
            highlight = {
                on_put = true,
                on_yank = true,
                timer = 500,
            },
            preserve_cursor_position = {
                enabled = true,
            },
        }
    end,
}

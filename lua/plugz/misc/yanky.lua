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
        {
            'HH',
            function()
                require('telescope').load_extension 'yank_history'
                require('telescope').extensions.yank_history.yank_history()
            end,
        },
    },
    config = function()
        local utils = require 'yanky.utils'
        local mapping = require 'yanky.telescope.mapping'

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
                    mappings = {
                        default = mapping.put 'p',
                        i = {
                            ['<c-p>'] = mapping.put 'p',
                            ['<c-k>'] = mapping.put 'P',
                            ['<c-x>'] = mapping.delete(),
                            ['<c-r>'] = mapping.set_register(
                                utils.get_default_register()
                            ),
                        },
                        n = {
                            p = mapping.put 'p',
                            P = mapping.put 'P',
                            d = mapping.delete(),
                        },
                    },
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

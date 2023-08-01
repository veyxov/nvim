return {
    'gbprod/yanky.nvim',
    init = function()
        local nx = { 'n', 'x' }

        vim.keymap.set(nx, 'h', '<Plug>(YankyYank)')

        vim.keymap.set(nx, 'p', '<Plug>(YankyPutAfter)')
        vim.keymap.set(nx, 'P', '<Plug>(YankyPutBefore)')

        vim.keymap.set('n', 'hn', '<Plug>(YankyCycleForward)')
        vim.keymap.set('n', 'hp', '<Plug>(YankyCycleBackward)')
    end,
    event = 'VeryLazy',
    config = function()
        require('yanky').setup {
            ring = {
                history_length = 100,
                storage = 'shada',
                sync_with_numbered_registers = true,
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

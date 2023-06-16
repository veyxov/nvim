local M = {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
}

M.config = function()
    require('copilot').setup {
        panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                jump_prev = 'gp',
                jump_next = 'gn',
                accept = '<CR>',
                refresh = 'gr',
                open = '<S-CR>',
            },
            layout = {
                position = 'bottom', -- | top | left | right
                ratio = 0.4,
            },
        },
        suggestion = {
            enabled = true,
            auto_trigger = false,
            debounce = 75,
            keymap = {
                accept = '<M-CR>',
                accept_word = false,
                accept_line = false,
                next = '<M-]>',
                prev = '<M-[>',
                dismiss = '<C-]>',
            },
        },
        filetypes = {},
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
    }
end

return M

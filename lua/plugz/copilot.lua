local M = {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
}

local F =
{
    "zbirenbaum/copilot-cmp",
    config = function()
        require("copilot_cmp").setup()
    end
}

M.config = function()
    require('copilot').setup {
        panel = {
            enabled = false,
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
            enabled = false,
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

return { M, F }

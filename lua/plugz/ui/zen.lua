local M = {
    {
        'folke/zen-mode.nvim',
        keys = {
            {
                '<leader>c',
                function() require('zen-mode').toggle {} end,
            },
        },
    },
    {
        'folke/twilight.nvim',
        config = function()
            require('twilight').setup {
                context = -1,
                treesitter = true,
            }
        end,
    },
}

local function toggle_fullscreen()
    local cmd = 'swaymsg'
    local args = { 'fullscreen' }
    local on_exit = nil

    vim.loop.spawn(cmd, { args = args }, on_exit)
end

M.config = function()
    require('zen-mode').setup {
        window = {
            width = 0.69,
        },
        on_open = function(_) toggle_fullscreen() end,
        on_close = function() toggle_fullscreen() end,
    }
end

return M

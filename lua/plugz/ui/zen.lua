local Zen = {
    'folke/zen-mode.nvim',
    keys = {
        {
            '<leader>c',
            function()
                require('zen-mode').toggle {}
            end,
        },
    },
}

Zen.config = function()
    require('zen-mode').setup {
        window = {
            width = 0.69,
        },
        plugins = {
            wezterm = {
                enabled = true,
                font = '+4',
            },
        },
    }
end

return {
    Zen,
}

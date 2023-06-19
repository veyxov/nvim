local Center = {
    'arnamak/stay-centered.nvim',
    event = 'VeryLazy',
    config = function()
        require('stay-centered').setup()
    end,
}

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
            width = .69
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
    Center,
    Zen,
}

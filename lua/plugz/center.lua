local Center = {
    'arnamak/stay-centered.nvim',
    event = 'VeryLazy',
    config = function()
        require 'stay-centered'
    end
}

local Zen = {
    'folke/zen-mode.nvim',
    keys = {
        { '<leader><leader>', function()
            require 'zen-mode'.toggle {
                window = {
                    width = 0.5,
                    backdrop = 1
                }
            }
        end }
    }
}

Zen.config = function()
    require 'zen-mode'.setup()
end

return {
    Center,
    Zen
}

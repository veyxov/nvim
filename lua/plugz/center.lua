local stay = {
    'arnamak/stay-centered.nvim',
    event = 'VeryLazy',
    config = function()
        require 'stay-centered'
    end
}

local zen = {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
    config = function()
        require 'zen-mode'.setup()
        require 'zen-mode'.toggle {
            window = {
                width = 0.7
            }
        }
    end
}

local M = { stay, zen }

return M

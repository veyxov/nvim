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
}

zen.config = function()
    local zen_mode = require 'zen-mode'

    local opts = {
        window = {
            width = 0.7,
            backdrop = 1
        }
    }
    zen_mode.setup()

    -- zen_mode.toggle(opts)
    require 'globals'.Map('<leader><leader>', function() zen_mode.toggle(opts) end)
end

local M = { stay, zen }

return M

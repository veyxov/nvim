local Center = {
    'arnamak/stay-centered.nvim',
    event = 'VeryLazy',
    config = function()
        require 'stay-centered'
    end
}

local Zen = {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
}

Zen.config = function()
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

return {
    Center,
    Zen
}

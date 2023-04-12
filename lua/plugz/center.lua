local stay = {
    'arnamak/stay-centered.nvim',
    event = 'VeryLazy',
    config = function()
        require 'stay-centered'
    end
}

local zen = {
    'folke/zen-mode.nvim',
    event = 'InsertEnter',
    config = function()
        require 'zen-mode'.setup()
        require("zen-mode").toggle({
            window = {
                width = .85 -- width will be 85% of the editor width
            }
        })
    end
}

local M = {
    stay,
    zen
}

return M

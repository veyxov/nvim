local map = require 'globals'.Map
local M =  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
    require 'gitsigns'.setup {
    }
    end
}

return M

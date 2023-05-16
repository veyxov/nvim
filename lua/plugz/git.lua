local map = require 'globals'.Map

local Gitsigns = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
        local gs = require 'gitsigns'
        gs.setup { }

        map('<leader>hs', gs.stage_hunk)
        map('<leader>hr', gs.reset_hunk)
    end
}

local Fugitive = {
    "tpope/vim-fugitive",
    lazy = false
}

return {
    Gitsigns,
    Fugitive
}

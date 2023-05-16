local map = require 'globals'.Map

local Gitsigns = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
        local gs = require 'gitsigns'
        gs.setup { }

        map('<leader>hs', gs.stage_hunk)
        map('<leader>hr', gs.reset_hunk)

        map('<leader>hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, 'v')
        map('<leader>hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, 'v')
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

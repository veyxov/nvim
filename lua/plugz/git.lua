local map = require 'globals'.Map

local Gitsigns = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
        local gs = require 'gitsigns'
        gs.setup { }

        map('hs', gs.stage_hunk)
        map('hr', gs.reset_hunk)

        map('hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, 'v')
        map('hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, 'v')

        map('ha', gs.stage_buffer)
        map('hU', gs.stage_buffer)

        map('<leader>hb', function() gs.blame_line{full=true} end)
    end
}

local Fugitive = {
    "tpope/vim-fugitive",
    lazy = false,
    init = function()
        map('<leader>gc', '<cmd>G commit<cr>')
    end
}

return {
    Gitsigns,
    Fugitive
}

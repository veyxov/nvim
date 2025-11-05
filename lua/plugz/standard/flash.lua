local lbls = 'hiearndst:,./?kyouxglcwvplfj'

local M = {
    'folke/flash.nvim',
    keys = {
        {
            's', mode = { 'n', 'o', 'x' },
            function() require('flash').jump { } end,
        },
        {
            'S', mode = { 'n', 'o', 'x' },
            function() require('flash').treesitter() end,
        },
        {
            "r", mode = "o",
            function() require("flash").remote() end
        },
        {
            "R", mode = {"o", "x"},
            function() require("flash").treesitter_search() end
        },
    },
}

M.opts = {
    labels = lbls,
    modes = { treesitter = { labels = lbls } }
}

return M

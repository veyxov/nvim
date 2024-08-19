local lbls = 'netsidarhol/m?f;cu,w'

local M = {
    'folke/flash.nvim',
    keys = {
        {
            's', mode = 'n',
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
    },
}

M.opts = {
    labels = lbls,
    modes = { treesitter = { labels = lbls } }
}

return M

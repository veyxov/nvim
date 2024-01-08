local lbls = 'netsidarhol/m?f;cu,w'

local M = {
    'folke/flash.nvim',
    keys = {
        '/',
        {
            's',
            mode = 'n',
            function()
                require('flash').jump {
                    search = {
                        mode = function(str) return '\\<' .. str end,
                    },
                }
            end,
        },
        {
            'S',
            mode = { 'n', 'o', 'x' },
            function()
                -- show labeled treesitter nodes around the search matches
                require('flash').treesitter_search()
            end,
            desc = 'Treesitter Search',
        },
    },
}

M.opts = {
    labels = lbls,
    search = {
        mode = "fuzzy"
    },
    modes = {
        treesitter = {
            labels = lbls,
        },
    },
}

return M

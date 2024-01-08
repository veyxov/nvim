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
            'r',
            mode = 'o',
            function()
                require('flash').remote()
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
        {
            -- Show diagnostic details
            '<leader>dd',
            function()
                require('flash').jump {
                    matcher = function(win)
                        return vim.tbl_map(
                            ---@param diag Diagnostic
                            function(diag)
                                return {
                                    pos = { diag.lnum + 1, diag.col },
                                    end_pos = {
                                        diag.end_lnum + 1,
                                        diag.end_col - 1,
                                    },
                                }
                            end,
                            vim.diagnostic.get(vim.api.nvim_win_get_buf(win))
                        )
                    end,
                    action = function(match, state)
                        vim.api.nvim_win_call(match.win, function()
                            vim.api.nvim_win_set_cursor(match.win, match.pos)
                            vim.diagnostic.open_float()
                            vim.api.nvim_win_set_cursor(match.win, state.pos)
                        end)
                    end,
                }
            end,
        },
        {
            '<leader>w',
            function() require('flash').jump {} end,
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

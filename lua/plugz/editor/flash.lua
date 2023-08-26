local lbls = 'netsidarhol/m?f;cu,w'

local M = {
    'folke/flash.nvim',
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').jump {
                }
            end,
        },
        {
            'r',
            mode = 'o',
            function()
                -- jump to a remote location to execute the operator
                require('flash').remote()
            end,
            desc = 'Remote Flash',
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
        -- search/jump in all windows
        multi_window = true,
        -- search direction
        forward = true,
        -- twhen `false`, find only matches in the given direction
        wrap = true,
        mode = 'fuzzy',
        -- behave like `incsearch`
        incremental = false,
        filetype_exclude = { 'notify', 'noice' },
    },
    jump = {
        -- save location in the jumplist
        jumplist = true,
        -- clear highlight after jump
        nohlsearch = true,
        -- automatically jump when there is only one match
        autojump = false,
    },
    modes = {
        search = {
            enabled = false, -- enable flash for search
        },
        char = {
            enabled = true,
            keys = { 'f', 'F', 't', 'T' },
            search = { wrap = true },
        },
        treesitter = {
            labels = lbls,
        },
    },
}

return M

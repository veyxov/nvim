local lbls = 'netsidarhol/m?f;cu,w'

local M = {
    'folke/flash.nvim',
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
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
            function() require('flash').treesitter() end,
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
            'R',
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
                        ---@param diag Diagnostic
                        return vim.tbl_map(
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
            function()
                require('flash').jump {}
            end,
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
        -- when `false`, find only matches in the given direction
        wrap = true,
        -- Each mode will take ignorecase and smartcase into account.
        -- * exact: exact match
        -- * search: regular search
        -- * fuzzy: fuzzy search
        -- * fun(str): custom function that returns a pattern
        --   For example, to only match at the beginning of a word:
        --   mode = function(str)
        --     return "\\<" .. str
        --   end,
        mode = 'exact',
        -- behave like `incsearch`
        incremental = false,
        filetype_exclude = { 'notify', 'noice' },
        -- Optional trigger character that needs to be typed before
        -- a jump label can be used. It's NOT recommended to set this,
        -- unless you know what you're doing
        trigger = '',
    },
    jump = {
        -- save location in the jumplist
        jumplist = true,
        -- jump position
        pos = 'start', ---@type "start" | "end" | "range"
        -- add pattern to search history
        history = false,
        -- add pattern to search register
        register = false,
        -- clear highlight after jump
        nohlsearch = false,
        -- automatically jump when there is only one match
        autojump = true,
    },
    highlight = {
        backdrop = true,
        -- Highlight the search matches
        matches = true,
        -- extmark priority
        priority = 5000,
        groups = {
            match = 'FlashMatch',
            current = 'FlashCurrent',
            backdrop = 'FlashBackdrop',
            label = 'FlashLabel',
        },
    },
    modes = {
        -- options used when flash is activated through
        -- a regular search with `/` or `?`
        search = {
            enabled = false, -- enable flash for search
        },
        -- options used when flash is activated through
        -- `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
            enabled = true,
            -- by default all keymaps are enabled, but you can disable some of them,
            -- by removing them from the list.
            keys = { 'f', 'F', 't', 'T', ';', ',' },
            search = { wrap = false },
            highlight = { backdrop = true },
            jump = { register = false },
        },
        -- options used for treesitter selections
        -- `require("flash").treesitter()`
        treesitter = {
            labels = lbls,
            jump = { pos = 'range' },
            highlight = {
                label = { before = true, after = true, style = 'inine' },
                backdrop = false,
                matches = false,
            },
        },
    },
}

return M

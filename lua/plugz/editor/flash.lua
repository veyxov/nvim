local lbls = 'netsidarhol/m?f;cu,w'

local M = {
    'folke/flash.nvim',
    ---@type Flash.Config
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
            function()
                -- default options: exact mode, multi window, all directions, with a backdrop
                require('flash').jump()
            end,
        },
        {
            'S',
            mode = { 'n', 'o', 'x' },
            function()
                require('flash').treesitter()
            end,
        },
        {
            -- Show diagnostic details
            '<leader>sd',
            function()
                require('flash').jump {
                    matcher = function(win)
                        ---@param diag Diagnostic
                        return vim.tbl_map(function(diag)
                            return {
                                pos = { diag.lnum + 1, diag.col },
                                end_pos = {
                                    diag.end_lnum + 1,
                                    diag.end_col - 1,
                                },
                            }
                        end, vim.diagnostic.get(
                            vim.api.nvim_win_get_buf(win)
                        ))
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
                require('flash').jump {
                    search = {
                        mode = function(str)
                            return '\\<' .. str
                        end,
                    },
                }
            end,
        },
        {
            '<leader>l',
            function()
                require('flash').jump {
                    search = { mode = 'search' },
                    highlight = { label = { after = { 0, 0 } } },
                    pattern = '^',
                }
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
        ---@type Flash.Pattern.Mode
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
        label = {
            -- add a label for the first match in the current window.
            -- you can always jump to the first match with `<CR>`
            current = true,
            -- show the label after the match
            after = true, ---@type boolean|number[]
            -- show the label before the match
            before = false, ---@type boolean|number[]
            -- position of the label extmark
            style = 'overlay', ---@type "eol" | "overlay" | "right_align" | "inline"
            -- flash tries to re-use labels that were already assigned to a position,
            -- when typing more characters. By default only lower-case labels are re-used.
            reuse = 'lowercase', ---@type "lowercase" | "all"
        },
        -- show a backdrop with hl FlashBackdrop
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
            enabled = true, -- enable flash for search
            highlight = { backdrop = false },
            jump = { history = true, register = true, nohlsearch = true },
            search = {
                -- `forward` will be automatically set to the search direction
                -- `mode` is always set to `search`
                -- `incremental` is set to `true` when `incsearch` is enabled
            },
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
                label = { before = true, after = true, style = 'inline' },
                backdrop = false,
                matches = false,
            },
        },
    },
}

return M
local gitsigns = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
        { 'ja', '<cmd>Gitsigns stage_hunk<cr>', mode = 'n' },
        { 'jA', '<cmd>Gitsigns stage_buffer<cr>', mode = 'n' },
        { 'jr', '<cmd>Gitsigns undo_stage_hunk<cr>', mode = 'n' },

        { 'ju', '<cmd>Gitsigns reset_hunk<cr>', mode = 'n' },
        { 'jU', '<cmd>Gitsigns reset_buffer<cr>', mode = 'n' },

        { 'jn', '<cmd>Gitsigns next_hunk<cr>', mode = 'n' },
        { 'jp', '<cmd>Gitsigns preview_hunk<cr>', mode = 'n' },

        { 'jb', '<cmd>Gitsigns blame_line<cr>', mode = 'n' },

        {
            'ju',
            function()
                require('gitsigns').reset_hunk {
                    vim.fn.line '.',
                    vim.fn.line 'v',
                }
            end,
            mode = 'v',
        },
        {
            'ja',
            function()
                require('gitsigns').stage_hunk {
                    vim.fn.line '.',
                    vim.fn.line 'v',
                }
            end,
            mode = 'v',
        },
    },
    config = function() require('gitsigns').setup {} end,
}

local diff = {
    'sindrets/diffview.nvim',
    cmd = 'Diffview',
    keys = {

    },
    config = function()

    end
}

local neogit = {
    "NeogitOrg/neogit",
    keys = {
        {
            "<leader>gc",
            function()
                require("neogit").action("commit", "commit")()
            end,
            desc = "Git commit",
        },
        {
            "<leader>gp",
            function()
                require("neogit").action("push", "to_upstream")()
            end,
            desc = "Git push",
        },
        {
            "<leader>gs",
            "<cmd>Neogit<cr>",
            desc = "Git status",
        },
    },
    cmd = { "Neogit" },
    opts = {
        disable_hint = true,
        graph_style = "kitty",
        use_default_keymaps = false,
        kind = "floating",
        -- Floating window style 
        floating = {
            relative = "editor",
            width = 0.8,
            height = 0.7,
            style = "minimal",
            border = "single",
        },
        integrations = {
            telescope = true,
            diffview = true,
        },
        mappings = {
            commit_editor = {
                ["<Esc>"] = "Close",
                ["qu"] = "Submit",
                ["<c-k>"] = "Abort",
                ["<m-p>"] = "PrevMessage",
                ["<m-n>"] = "NextMessage",
                ["<m-r>"] = "ResetMessage",
            },
            commit_editor_I = {
                ["<c-c>"] = "Submit",
                ["<c-k>"] = "Abort",
            },
            rebase_editor = {
                ["p"] = "Pick",
                ["r"] = "Reword",
                ["e"] = "Edit",
                ["s"] = "Squash",
                ["f"] = "Fixup",
                ["x"] = "Execute",
                ["d"] = "Drop",
                ["b"] = "Break",
                ["q"] = "Close",
                ["<cr>"] = "OpenCommit",
                ["gk"] = "MoveUp",
                ["gj"] = "MoveDown",
                ["<c-c><c-c>"] = "Submit",
                ["<c-c><c-k>"] = "Abort",
                ["[c"] = "OpenOrScrollUp",
                ["]c"] = "OpenOrScrollDown",
            },
            rebase_editor_I = {
                ["<c-c><c-c>"] = "Submit",
                ["<c-c><c-k>"] = "Abort",
            },
            finder = {
                ["<cr>"] = "Select",
                ["<c-c>"] = "Close",
                ["<esc>"] = "Close",
                ["<c-n>"] = "Next",
                ["<c-p>"] = "Previous",
                ["<down>"] = "Next",
                ["<up>"] = "Previous",
                ["<tab>"] = "InsertCompletion",
                ["<c-y>"] = "CopySelection",
                ["<space>"] = "MultiselectToggleNext",
                ["<s-space>"] = "MultiselectTogglePrevious",
                ["<c-j>"] = "NOP",
                ["<ScrollWheelDown>"] = "ScrollWheelDown",
                ["<ScrollWheelUp>"] = "ScrollWheelUp",
                ["<ScrollWheelLeft>"] = "NOP",
                ["<ScrollWheelRight>"] = "NOP",
                ["<LeftMouse>"] = "MouseClick",
                ["<2-LeftMouse>"] = "NOP",
            },
            -- Setting any of these to `false` will disable the mapping.
            popup = {
                ["?"] = "HelpPopup",
                ["A"] = "CherryPickPopup",
                ["d"] = "DiffPopup",
                ["M"] = "RemotePopup",
                ["P"] = "PushPopup",
                ["X"] = "ResetPopup",
                ["Z"] = "StashPopup",
                ["i"] = "IgnorePopup",
                ["t"] = "TagPopup",
                ["b"] = "BranchPopup",
                ["B"] = "BisectPopup",
                ["w"] = "WorktreePopup",
                ["c"] = "CommitPopup",
                ["f"] = "FetchPopup",
                ["l"] = "LogPopup",
                ["m"] = "MergePopup",
                ["p"] = "PullPopup",
                ["r"] = "RebasePopup",
                ["v"] = "RevertPopup",
            },
            status = {
                ["j"] = "MoveDown",
                ["k"] = "MoveUp",
                ["o"] = "OpenTree",
                ["q"] = "Close",
                ["I"] = "InitRepo",
                ["1"] = "Depth1",
                ["2"] = "Depth2",
                ["3"] = "Depth3",
                ["4"] = "Depth4",
                ["Q"] = "Command",
                ["<tab>"] = "Toggle",
                ["za"] = "Toggle",
                ["zo"] = "OpenFold",
                ["x"] = "Discard",
                ["s"] = "Stage",
                ["S"] = "StageUnstaged",
                ["<c-s>"] = "StageAll",
                ["u"] = "Unstage",
                ["K"] = "Untrack",
                ["U"] = "UnstageStaged",
                ["y"] = "ShowRefs",
                ["$"] = "CommandHistory",
                ["Y"] = "YankSelected",
                ["<c-r>"] = "RefreshBuffer",
                ["<cr>"] = "GoToFile",
                ["<s-cr>"] = "PeekFile",
                ["<c-v>"] = "VSplitOpen",
                ["<c-x>"] = "SplitOpen",
                ["<c-t>"] = "TabOpen",
                ["{"] = "GoToPreviousHunkHeader",
                ["}"] = "GoToNextHunkHeader",
                ["[c"] = "OpenOrScrollUp",
                ["]c"] = "OpenOrScrollDown",
                ["<c-k>"] = "PeekUp",
                ["<c-j>"] = "PeekDown",
                ["<c-n>"] = "NextSection",
                ["<c-p>"] = "PreviousSection",
            },
        },
    }
}

return {
    gitsigns,
    diff,
    neogit
}

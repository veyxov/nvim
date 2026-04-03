local gitsigns = { 'lewis6991/gitsigns.nvim',
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
    cmd = 'DiffviewOpen',
    keys = {
        { 'do', '<cmd>DiffviewOpen<cr>', mode = 'n' },
        { 'dc', '<cmd>DiffviewClose<cr>', mode = 'n' },
    },
    config = function()
        local actions = require("diffview.actions")

        require("diffview").setup({

            enhanced_diff_hl = true,
            keymaps = {
                disable_defaults = true,

                view = {
                    { "n", "<Tab>",       actions.select_next_entry,              { desc = "Open the diff for the next file" } },
                    { "n", "<S-Tab>",     actions.select_prev_entry,              { desc = "Open the diff for the previous file" } },
                    { "n", "<leader>e",   actions.goto_file_tab,                 { desc = "Open the file in the previous tabpage" } },
                    { "n", "<leader>f",   actions.focus_files,                    { desc = "Bring focus to the file panel" } },
                    { "n", "<leader>b",   actions.toggle_files,                   { desc = "Toggle the file panel." } },
                    { "n", "g<C-x>",      actions.cycle_layout,                   { desc = "Cycle through available layouts." } },
                    { "n", "xn",          actions.prev_conflict,                  { desc = "In the merge-tool: jump to the previous conflict" } },
                    { "n", "xp",          actions.next_conflict,                  { desc = "In the merge-tool: jump to the next conflict" } },
                    { "n", "<leader>co",  actions.conflict_choose("ours"),        { desc = "Choose the OURS version of a conflict" } },
                    { "n", "<leader>ct",  actions.conflict_choose("theirs"),      { desc = "Choose the THEIRS version of a conflict" } },
                    { "n", "<leader>cb",  actions.conflict_choose("base"),        { desc = "Choose the BASE version of a conflict" } },
                    { "n", "<leader>ca",  actions.conflict_choose("all"),         { desc = "Choose all the versions of a conflict" } },
                    { "n", "dx",          actions.conflict_choose("none"),        { desc = "Delete the conflict region" } },
                },
                file_panel = {
                    { "n", "e",              actions.select_next_entry,                     { desc = "Bring the cursor to the next file entry" } },
                    { "n", "i",              actions.select_prev_entry,                     { desc = "Bring the cursor to the previous file entry" } },
                    { "n", "<cr>",           actions.select_entry,                   { desc = "Open the diff for the selected entry" } },
                    { "n", "s",              actions.toggle_stage_entry,             { desc = "Stage / unstage the selected entry" } },
                    { "n", "S",              actions.stage_all,                      { desc = "Stage all entries" } },
                    { "n", "U",              actions.unstage_all,                    { desc = "Unstage all entries" } },
                    { "n", "X",              actions.restore_entry,                  { desc = "Restore entry to the state on the left side" } },
                    { "n", "L",              actions.open_commit_log,                { desc = "Open the commit log panel" } },
                    { "n", "zo",             actions.open_fold,                      { desc = "Expand fold" } },
                    { "n", "h",              actions.close_fold,                     { desc = "Collapse fold" } },
                    { "n", "zc",             actions.close_fold,                     { desc = "Collapse fold" } },
                    { "n", "za",             actions.toggle_fold,                    { desc = "Toggle fold" } },
                    { "n", "zR",             actions.open_all_folds,                 { desc = "Expand all folds" } },
                    { "n", "zM",             actions.close_all_folds,                { desc = "Collapse all folds" } },
                    { "n", "<c-b>",          actions.scroll_view(-0.25),             { desc = "Scroll the view up" } },
                    { "n", "<c-f>",          actions.scroll_view(0.25),              { desc = "Scroll the view down" } },
                    { "n", "<tab>",          actions.select_next_entry,              { desc = "Open the diff for the next file" } },
                    { "n", "<s-tab>",        actions.select_prev_entry,              { desc = "Open the diff for the previous file" } },
                    { "n", "[F",             actions.select_first_entry,             { desc = "Open the diff for the first file" } },
                    { "n", "]F",             actions.select_last_entry,              { desc = "Open the diff for the last file" } },
                    { "n", "gf",             actions.goto_file_edit,                 { desc = "Open the file in the previous tabpage" } },
                    { "n", "<C-w><C-f>",     actions.goto_file_split,                { desc = "Open the file in a new split" } },
                    { "n", "<C-w>gf",        actions.goto_file_tab,                  { desc = "Open the file in a new tabpage" } },
                    { "n", "<leader>i",      actions.listing_style,                  { desc = "Toggle between 'list' and 'tree' views" } },
                    { "n", "f",              actions.toggle_flatten_dirs,            { desc = "Flatten empty subdirectories in tree listing style" } },
                    { "n", "R",              actions.refresh_files,                  { desc = "Update stats and entries in the file list" } },
                    { "n", "<leader>e",      actions.focus_files,                    { desc = "Bring focus to the file panel" } },
                    { "n", "<leader>b",      actions.toggle_files,                   { desc = "Toggle the file panel" } },
                    { "n", "g<C-x>",         actions.cycle_layout,                   { desc = "Cycle available layouts" } },
                    { "n", "[x",             actions.prev_conflict,                  { desc = "Go to the previous conflict" } },
                    { "n", "]x",             actions.next_conflict,                  { desc = "Go to the next conflict" } },
                    { "n", "g?",             actions.help("file_panel"),             { desc = "Open the help panel" } },
                    { "n", "<leader>cO",     actions.conflict_choose_all("ours"),    { desc = "Choose the OURS version of a conflict for the whole file" } },
                    { "n", "<leader>cT",     actions.conflict_choose_all("theirs"),  { desc = "Choose the THEIRS version of a conflict for the whole file" } },
                    { "n", "<leader>cB",     actions.conflict_choose_all("base"),    { desc = "Choose the BASE version of a conflict for the whole file" } },
                    { "n", "<leader>cA",     actions.conflict_choose_all("all"),     { desc = "Choose all the versions of a conflict for the whole file" } },
                    { "n", "dX",             actions.conflict_choose_all("none"),    { desc = "Delete the conflict region for the whole file" } },
                },

            }
        })
    end
}

local neogit = {
    "NeogitOrg/neogit",
    keys = {
        {
            "<leader>ga",
            function()
                require("neogit").action("commit", "commit")()
            end,
            desc = "Git commit",
        },
        {
            "<leader>gc",
            function()
                require("neogit").action("push", "to_upstream")()
            end,
            desc = "Git push",
        },
        {
            "<leader>gg",
            "<cmd>Neogit<cr>",
            desc = "Git status",
        },
    },
    cmd = { "Neogit" },
    opts = {
        disable_hint = true,
        graph_style = "kitty",
        integrations = {
            diffview = true,
        },

        commit_editor = {
            ["qu"]         = "Submit",
            ["<c-c><c-k>"] = "Abort",
        },
        commit_editor_I = {
            ["<c-c><c-c>"] = "Submit",
            ["<c-c><c-k>"] = "Abort",
        }
    }
}

return {
    gitsigns,
    diff,
    neogit
}

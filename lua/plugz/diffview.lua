local Diffview = {
    'sindrets/diffview.nvim',
    keys = {
        { 'jdo', '<cmd>DiffviewOpen<cr>' },
        { 'jdh', '<cmd>DiffviewFileHistory %<cr>' }, -- current file history
    },
    cmd = {
        'DiffviewOpen',
    },
}

Diffview.config = function()
    local actions = require 'diffview.actions'

    require('diffview').setup {
        enhanced_diff_hl = true,
        use_icons = true,
        show_help_hints = true,
        keymaps = {
            disable_defaults = true,
            view = {
                { 'n', 'f', actions.focus_files },
                {
                    'n',
                    'qu',
                    '<cmd>DiffviewClose<cr>',
                },
                {
                    'n',
                    'e',
                    actions.select_next_entry,
                },
                {
                    'n',
                    'i',
                    actions.select_prev_entry,
                },
                {
                    'n',
                    'gl',
                    actions.goto_file_edit,
                },
                {
                    'n',
                    '<leader>e',
                    actions.focus_files,
                },
                {
                    'n',
                    '<leader>b',
                    actions.toggle_files,
                },
                {
                    'n',
                    '<C-n>',
                    actions.cycle_layout,
                },
                -- TODO: Change these, this will come in handy ocasionally
                {
                    'n',
                    'ci',
                    actions.prev_conflict,
                },
                {
                    'n',
                    'ce',
                    actions.next_conflict,
                },
                -- TODO: This.
                {
                    'n',
                    '<leader>co',
                    actions.conflict_choose 'ours',
                },
                {
                    'n',
                    '<leader>ct',
                    actions.conflict_choose 'theirs',
                },
                {
                    'n',
                    '<leader>cb',
                    actions.conflict_choose 'base',
                },
                {
                    'n',
                    '<leader>ca',
                    actions.conflict_choose 'all',
                },
                {
                    'n',
                    'dx',
                    actions.conflict_choose 'none',
                },
                {
                    'n',
                    '<leader>cO',
                    actions.conflict_choose_all 'ours',
                },
                {
                    'n',
                    '<leader>cT',
                    actions.conflict_choose_all 'theirs',
                },
                {
                    'n',
                    '<leader>cB',
                    actions.conflict_choose_all 'base',
                },
                {
                    'n',
                    '<leader>cA',
                    actions.conflict_choose_all 'all',
                },
                {
                    'n',
                    'dX',
                    actions.conflict_choose_all 'none',
                },
            },
            -- TODO: Change these
            file_history_panel = {
                {
                    'n',
                    'g!',
                    actions.options,
                    { desc = 'Open the option panel' },
                },
                {
                    'n',
                    '<C-A-d>',
                    actions.open_in_diffview,
                    {
                        desc = 'Open the entry under the cursor in a diffview',
                    },
                },
                {
                    'n',
                    'y',
                    actions.copy_hash,
                    {
                        desc = 'Copy the commit hash of the entry under the cursor',
                    },
                },
                {
                    'n',
                    'L',
                    actions.open_commit_log,
                    { desc = 'Show commit details' },
                },
                {
                    'n',
                    'zR',
                    actions.open_all_folds,
                    { desc = 'Expand all folds' },
                },
                {
                    'n',
                    'zM',
                    actions.close_all_folds,
                    { desc = 'Collapse all folds' },
                },
                {
                    'n',
                    'j',
                    actions.next_entry,
                    {
                        desc = 'Bring the cursor to the next file entry',
                    },
                },
                {
                    'n',
                    '<down>',
                    actions.next_entry,
                    {
                        desc = 'Bring the cursor to the next file entry',
                    },
                },
                {
                    'n',
                    'k',
                    actions.prev_entry,
                    {
                        desc = 'Bring the cursor to the previous file entry.',
                    },
                },
                {
                    'n',
                    '<up>',
                    actions.prev_entry,
                    {
                        desc = 'Bring the cursor to the previous file entry.',
                    },
                },
                {
                    'n',
                    '<cr>',
                    actions.select_entry,
                    {
                        desc = 'Open the diff for the selected entry.',
                    },
                },
                {
                    'n',
                    'o',
                    actions.select_entry,
                    {
                        desc = 'Open the diff for the selected entry.',
                    },
                },
                {
                    'n',
                    '<2-LeftMouse>',
                    actions.select_entry,
                    {
                        desc = 'Open the diff for the selected entry.',
                    },
                },
                {
                    'n',
                    '<c-b>',
                    actions.scroll_view(-0.25),
                    { desc = 'Scroll the view up' },
                },
                {
                    'n',
                    '<c-f>',
                    actions.scroll_view(0.25),
                    { desc = 'Scroll the view down' },
                },
                {
                    'n',
                    '<tab>',
                    actions.select_next_entry,
                    { desc = 'Open the diff for the next file' },
                },
                {
                    'n',
                    '<s-tab>',
                    actions.select_prev_entry,
                    {
                        desc = 'Open the diff for the previous file',
                    },
                },
                {
                    'n',
                    'gf',
                    actions.goto_file_edit,
                    {
                        desc = 'Open the file in the previous tabpage',
                    },
                },
                {
                    'n',
                    '<C-w><C-f>',
                    actions.goto_file_split,
                    { desc = 'Open the file in a new split' },
                },
                {
                    'n',
                    '<C-w>gf',
                    actions.goto_file_tab,
                    { desc = 'Open the file in a new tabpage' },
                },
                {
                    'n',
                    '<leader>e',
                    actions.focus_files,
                    { desc = 'Bring focus to the file panel' },
                },
                {
                    'n',
                    '<leader>b',
                    actions.toggle_files,
                    { desc = 'Toggle the file panel' },
                },
                {
                    'n',
                    'g<C-x>',
                    actions.cycle_layout,
                    { desc = 'Cycle available layouts' },
                },
                {
                    'n',
                    'g?',
                    actions.help 'file_history_panel',
                    { desc = 'Open the help panel' },
                },
            },
            file_panel = {
                {
                    'n',
                    'qu',
                    '<cmd>DiffviewClose<cr>',
                },
                {
                    'n',
                    'cc',
                    '<cmd>G commit<cr>',
                },
                {
                    'n',
                    'ca',
                    '<cmd>G commit --amend <cr>',
                },
                {
                    'n',
                    'e',
                    actions.select_next_entry,
                },
                {
                    'n',
                    'i',
                    actions.select_prev_entry,
                },
                {
                    'n',
                    'A',
                    actions.stage_all,
                },
                {
                    'n',
                    'a',
                    actions.toggle_stage_entry,
                },
            },
            option_panel = {
                {
                    'n',
                    'qu',
                    '<cmd>DiffviewClose<cr>',
                },
                {
                    'n',
                    '<tab>',
                    actions.select_entry,
                },
                {
                    'n',
                    'qu',
                    actions.close,
                },
                {
                    'n',
                    'g?',
                    actions.help 'option_panel',
                },
            },
            help_panel = {
                { 'n', 'qu', actions.close },
                { 'n', '<esc>', actions.close },
            },
        },
        hooks = {
            ---@diagnostic disable-next-line: unused-local
            diff_buf_read = function(bufnr)
                -- Change local options in diff buffers
                vim.opt_local.list = false
                vim.opt_local.colorcolumn = { 80 }
            end,
        },
    }
end

return Diffview

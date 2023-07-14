local Diffview = {
    'sindrets/diffview.nvim',
    keys = {
        { 'jdo', '<cmd>DiffviewOpen<cr>' },
        { 'jdh', '<cmd>DiffviewFileHistory %<cr>' },
    },
    cmd = {
        'DiffviewOpen',
    },
}

Diffview.config = function()
    -- Lua
    local actions = require 'diffview.actions'

    require('diffview').setup {
        enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
        use_icons = true, -- Requires nvim-web-devicons
        show_help_hints = true, -- Show hints for how to open the help panel
        keymaps = {
            disable_defaults = true, -- Disable the default keymaps
            view = {
                -- The `view` bindings are active in the diff buffers, only when the current
                -- tabpage is a Diffview.
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
            file_panel = {
                {
                    'n',
                    'qu',
                    '<cmd>DiffviewClose<cr>',
                },
                {
                    'n',
                    'c',
                    '<cmd>G commit<cr>',
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
                }
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
    }
end

return Diffview

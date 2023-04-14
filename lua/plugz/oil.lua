return {
    'stevearc/oil.nvim',
    config = function()
        require 'oil'.setup({
            columns = {
                "icon",
                --"permissions",
                "size",
                --"mtime",
            },
            win_options = {
                conceallevel = 3,
                concealcursor = "in",
            },
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ["<CR>"] = "actions.select",
                ["<C-i>"] = "actions.select_vsplit",
                ["<C-e>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["q"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["f"] = "actions.parent",
                ["h"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
                ["Y"] = "actions.copy_entry_path",
            },
            float = {
                padding = 10,
                border = "single",
                win_options = {
                    winblend = 10,
                },
            },
            preview = {
                -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_width and max_width can be a single value or a list of mixed integer/float types.
                -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
                max_width = 0.9,
                -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
                min_width = { 40, 0.4 },
                -- optionally define an integer/float for the exact width of the preview window
                width = nil,
                -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_height and max_height can be a single value or a list of mixed integer/float types.
                -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
                max_height = 0.9,
                -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
                min_height = { 5, 0.1 },
                -- optionally define an integer/float for the exact height of the preview window
                height = nil,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            -- Configuration for the floating progress window
            progress = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = { 10, 0.9 },
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                minimized_border = "none",
                win_options = {
                    winblend = 0,
                },
            },
        })
    end,
    keys = {
        { '<C-n>', function() require 'oil'.open_float() end },
    },
}

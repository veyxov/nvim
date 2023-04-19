local M = {
    'stevearc/oil.nvim',
    keys = {
        { '<C-n>', function() require 'oil'.open_float() end },
    },
}

M.config = function()
    require 'oil'.setup({
        columns = {
            "icon",
            "size",
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
            ["e"] = "j",
            ["i"] = "k",
            ["n"] = "actions.parent",
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
            padding = 3,
            border = "single",
            win_options = {
                winblend = 5,
            },
        },
    })
end

return M

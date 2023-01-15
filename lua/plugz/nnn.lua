local M = {
    "luukvbaal/nnn.nvim",
    cmd = "NnnExplorer"
}

M.init = function()
    vim.keymap.set("n", "<cr>n", "<cmd>NnnExplorer<cr>")
end

M.config = function()
    local nnn = require 'nnn'
    local builtin = nnn.builtin

    local config = {
        explorer = {
            width = 24, -- width of the vertical split
            tabs = true, -- seperate nnn instance per tab
            fullscreen = true, -- whether to fullscreen explorer window when current tab is empty
        },
        picker = {
            style = {
                border = "none" -- border decoration for example "rounded"(:h nvim_open_win)
            },
        },
        auto_close = true,
        mappings = {
            { "ot", builtin.open_in_tab }, -- open file(s) in tab
            { "os", builtin.open_in_split }, -- open file(s) in split
            { "ov", builtin.open_in_vsplit }, -- open file(s) in vertical split
            { "op", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
            { "oy", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
            { "oc", builtin.cd_to_path }, -- cd to file directory
            { "oC", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
        }, -- table containing mappings, see below
    }
    nnn.setup(config)
end

return M

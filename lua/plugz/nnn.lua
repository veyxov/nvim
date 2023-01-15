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
            mappings = {
                { "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
                { "<C-s>", builtin.open_in_split }, -- open file(s) in split
                { "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
                { "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
                { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
                { "<C-w>", builtin.cd_to_path }, -- cd to file directory
                { "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
            }
        }, -- table containing mappings, see below
    }
    nnn.setup(config)
end

return M

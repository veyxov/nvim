local M = {
    "luisiacc/gruvbox-baby",
    event = "InsertEnter"
}

M.config = function()
    -- vim.g.gruvbox_baby_telescope_theme = 1
    vim.g.gruvbox_baby_transparent_mode = 1

    vim.cmd.colorscheme "gruvbox-baby"
end

return M

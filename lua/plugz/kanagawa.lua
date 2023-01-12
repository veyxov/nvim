local M = {
    "rebelot/kanagawa.nvim",
    enable = false,
    event = "InsertEnter"
}

M.config = function()
    vim.cmd.colorscheme "kanagawa"
end

return M

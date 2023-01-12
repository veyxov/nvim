local M = {
    "rebelot/kanagawa.nvim",
    event = "InsertEnter",
    enabled = false,
}

M.config = function()
    vim.cmd.colorscheme "kanagawa"
end

return M

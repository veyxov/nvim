local M = {
    "luukvbaal/nnn.nvim",
    cmd = "NnnExplorer"
}

M.init = function ()
    vim.keymap.set("n", "<cr>n", "<cmd>NnnExplorer<cr>")
end

M.config = function()
    require("nnn").setup()
end

return M

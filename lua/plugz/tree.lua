local M = {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly',
    cmd = "NvimTreeToggle"
}

M.init = function()
    vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<cr>")
end

M.config = function()
    require("nvim-tree").setup({})
end

return M

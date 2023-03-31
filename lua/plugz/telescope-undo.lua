local M = {
    "debugloop/telescope-undo.nvim",
    lazy = false,
}

M.config = function()
    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
end

return M

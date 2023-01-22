local M = {
    "Pocco81/true-zen.nvim",
    cmd = { "TZAtaraxis", "TZNarrow" }
}

M.init = function()
    vim.keymap.set("n", "zz", "<cmd>TZAtaraxis<cr>")

    -- TODO: Find out how to do it in vim.keymap.set()
    vim.api.nvim_set_keymap("v", "zz", ":'<,'>TZNarrow<CR>", {})
end

M.config = function()
    require("true-zen").setup { }
end

return M

return {
    "lmburns/lf.nvim",
    lazy = false,
    config = function()
        require("lf").setup({})

        vim.keymap.set("n", "<C-o>", ":Lf<CR>")
    end,
    dependencies = { "plenary.nvim", "akinsho/toggleterm.nvim" }
}

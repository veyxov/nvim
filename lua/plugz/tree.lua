return {
    "lmburns/lf.nvim",
    config = function()
        -- This feature will not work if the plugin is lazy-loaded
        vim.g.lf_netrw = 1

        require("lf").setup(
            {
                escape_quit = false,
                border = "rounded",
                highlights = { FloatBorder = { guifg = require("kimbox.palette").colors.magenta } }
            }
        )

        vim.keymap.set("n", "<C-o>", ":Lf<CR>")
    end,
    requires = { "plenary.nvim", "toggleterm.nvim" }
}

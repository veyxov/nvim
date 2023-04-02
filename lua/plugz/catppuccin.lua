local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = false
}

M.config = function()
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.1,
        },
        integrations = {
            cmp = true,
            telescope = true,
        },
    })

    vim.cmd.colorscheme 'catppuccin';
end

return M

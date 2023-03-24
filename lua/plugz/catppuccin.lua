local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = true
}

M.config = function()
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.1,
        },
        no_italic = false, -- Force no italic
        no_bold = false,   -- Force no bold
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            telescope = true,
        },
    })

    vim.cmd.colorscheme 'catppuccin';
end

return M

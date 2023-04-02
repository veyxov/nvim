local M = {
    'folke/tokyonight.nvim',
    enabled = true,
    event = "InsertEnter"
}

M.config = function()
    require("tokyonight").setup({
        transparent = false,
        styles = {
            -- comments = { italic = true },
            -- keywords = { italic = false },
            -- functions = { bold = true, italic = false },
            -- variables = { italic = false },
        },
    })
    vim.cmd.colorscheme 'tokyonight-night'
end

return M

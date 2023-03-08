local M = {
    'folke/tokyonight.nvim',
    enabled = true,
    event = "InsertEnter"
}

M.config = function()
    require("tokyonight").setup({
        transparent = true,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true, italic = true },
            variables = {}
        },
    })
    vim.cmd.colorscheme 'tokyonight-night'
end

return M

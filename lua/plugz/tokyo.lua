local M = {
    'folke/tokyonight.nvim',
    enabled = true,
    event = "InsertEnter"
}

M.config = function()
    require("tokyonight").setup({
        transparent = true,
    })
    vim.cmd.colorscheme 'tokyonight-night'
end

return M

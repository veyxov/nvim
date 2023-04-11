local M = {
    'folke/tokyonight.nvim',
    enabled = true,
    event = "InsertEnter"
}

M.config = function()
    require("tokyonight").setup({
        transparent = false,
    })
    vim.cmd.colorscheme 'tokyonight-moon'
end

return M

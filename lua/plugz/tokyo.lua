local M = {
    'folke/tokyonight.nvim',
    enabled = true,
    event = "InsertEnter"
}

M.config = function()
    vim.cmd.colorscheme 'tokyonight-night'
end

return M

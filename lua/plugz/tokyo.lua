local M = {
    'folke/tokyonight.nvim',
    enabled = false,
    event = "InsertEnter"
}

M.config = function()
    vim.cmd.colorscheme 'tokyonight-night'
end

return M

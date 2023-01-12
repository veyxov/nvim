local M = {
    'folke/tokyonight.nvim',
    event = "InsertEnter"
}

M.config = function()
    vim.cmd.colorscheme 'tokyonight-night'
end

return M

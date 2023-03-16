local M = {
    'rose-pine/neovim',
    event = "InsertEnter"
}

M.config = function()
    vim.cmd.colorscheme 'rose-pine'
end

return M

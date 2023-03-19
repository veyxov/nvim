local M = {
    'rose-pine/neovim',
    event = "InsertEnter",
    enabled = false
}

M.config = function()
    vim.cmd.colorscheme 'rose-pine'
end

return M

local M = {
    'nyoom-engineering/oxocarbon.nvim',
    enabled = false,
    event = 'VeryLazy'
}

M.config = function()
    vim.cmd.colorscheme 'oxocarbon'
end

return M

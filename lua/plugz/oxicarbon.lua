local M = {
    'nyoom-engineering/oxocarbon.nvim',
    enabled = true,
    event = 'VeryLazy'
}

M.config = function()
    vim.cmd.colorscheme 'oxocarbon'
end

return M

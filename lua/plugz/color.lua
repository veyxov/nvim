local M = {
    "ellisonleao/gruvbox.nvim",
    event = 'VeryLazy',
    config = function()
        vim.cmd.colorscheme 'gruvbox'
    end,
}

return M

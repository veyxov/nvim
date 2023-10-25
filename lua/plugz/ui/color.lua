return {
    'ellisonleao/gruvbox.nvim',
    event = 'VeryLazy',
    priority = 1000,
    config = function()
        -- Default options:
        require('gruvbox').setup {
            transparent_mode = false,
        }
        vim.cmd 'colorscheme gruvbox'
    end,
}

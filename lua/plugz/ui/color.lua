return {
    'ellisonleao/gruvbox.nvim',
    event = 'VeryLazy',
    config = function()
        require('gruvbox').setup {
            transparent_mode = false,
            overrides = {
                Normal = {
                    bg = '#000000',
                },
            },
        }
        vim.cmd.colorscheme 'gruvbox'
    end,
}

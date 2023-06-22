return {
    { import = 'plugz.git' },
    { import = 'plugz.ui' },
    { 'nvim-lua/plenary.nvim' },
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {}
        end,
    },
}

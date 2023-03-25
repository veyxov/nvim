return {
    { 'nvim-lua/plenary.nvim' },
    { 'https://github.com/kmonad/kmonad-vim', lazy = false },
    {
        'nvim-tree/nvim-web-devicons',
        config = function() require 'nvim-web-devicons'.setup {} end
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
}

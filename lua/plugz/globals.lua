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
            local lbls = 'neiosart'
            require("nvim-autopairs").setup {
                fast_wrap = {
                    map = '<C-w>', -- mnemonic: control wrap
                    keys = lbls
                }
            }
        end
    }
}

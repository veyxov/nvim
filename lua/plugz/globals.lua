return {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons', config = function() require 'nvim-web-devicons'.setup {} end },
    { 'windwp/nvim-autopairs', config = function()
        require("nvim-autopairs").setup {}
    end }
}

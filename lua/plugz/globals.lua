return {
    { 'nvim-lua/plenary.nvim' },
    { 'windwp/nvim-autopairs', config = function()
        require("nvim-autopairs").setup {}
    end }
}

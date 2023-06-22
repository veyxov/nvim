return { 
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    keys = {
        {'<leader>gd', function()require('neogen').generate()end}
    },
    config = function()
        require('neogen').setup {
        languages = {
        cs = {
            template = {
                annotation_convention = "xmldoc"
                }
        },
    }
}
    end,
}

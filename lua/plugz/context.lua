return {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    dependencies = {
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
        require'treesitter-context'.setup{
            multiline_threshold = 1, -- don't show every constructor parameter
            mode = 'topline', -- too noisy when moving cursor
        }
    end
}

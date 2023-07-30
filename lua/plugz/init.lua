return {
    { 'nvim-lua/plenary.nvim' },
    { import = 'plugz.git' },
    { import = 'plugz.ui' },
    { import = 'plugz.tree-sitter' },
    { import = 'plugz.editor' },
    { import = 'plugz.misc' },
    { import = 'plugz.lsp' },
    {
        'nvim-tree/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup {} end,
    },
}

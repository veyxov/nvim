return {
    { import = 'plugz.git' },
    { import = 'plugz.ui' },
    { import = 'plugz.tree-sitter' },
    { import = 'plugz.editor' },
    { import = 'plugz.misc' },
    { import = 'plugz.lsp' },
    { import = 'plugz.debug' },
    { 'nvim-lua/plenary.nvim' },
    {
        'nvim-tree/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup {} end,
    },
}

return {
    { 'nvim-lua/plenary.nvim' },
    { -- TODO: Maybe delete this?
        'nvim-tree/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup {} end,
    },
}

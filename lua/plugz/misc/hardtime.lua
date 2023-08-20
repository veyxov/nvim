return {
    'm4xshen/hardtime.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    config = function() require('hardtime').setup() end,
}

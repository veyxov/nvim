return {
    'm4xshen/hardtime.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
        local opts = {
            restricted_keys = {
                ['<Up>'] = { 'n' },
                ['<Down>'] = { 'n' },
                ['<Left>'] = { 'n' },
                ['<Right>'] = { 'n' },
                ['e'] = { 'n' },
                ['w'] = { 'n' },
                ['b'] = { 'n' },
                ['-'] = {},
            },
            disabled_keys = {
                ['<Up>'] = {},
                ['<Down>'] = {},
                ['<Left>'] = {},
                ['<Right>'] = {},
            },
        }
        require('hardtime').setup(opts)
    end,
}

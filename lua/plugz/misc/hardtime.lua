return {
    'm4xshen/hardtime.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
        local opts = {
            restricted_keys = {
                ['<Up>'] = { '', 'i' },
                ['<Down>'] = { '', 'i' },
                ['<Left>'] = { '', 'i' },
                ['<Right>'] = { '', 'i' },
                ['e'] = { '', 'i' },
                ['w'] = { '', 'i' },
                ['b'] = { '', 'i' },
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

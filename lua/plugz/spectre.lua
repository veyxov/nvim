return {
    'nvim-pack/nvim-spectre',
    keys = {
        { '<leader>sr', function() require('spectre').open() end },
    },
}

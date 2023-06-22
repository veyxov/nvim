return {
    'arnamak/stay-centered.nvim',
    event = 'VeryLazy',
    config = function()
        require('stay-centered').setup()
    end,
}


return {
    'nagy135/typebreak.nvim',
    keys = {
        {
            '<leader>tb',
            function()
                require('typebreak').start()
            end,
            { desc = 'Typebreak' },
        },
    },
}

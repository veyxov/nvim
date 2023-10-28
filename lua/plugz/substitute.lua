return {
    'gbprod/substitute.nvim',
    keys = {
        { 'r', function() require('substitute').operator() end },
        { 'r', function() require('substitute').visual() end, mode = 'x' },
        {
            '<leader>r',
            function() require('substitute.range').operator() end,
        },
        {
            '<leader>r',
            function() require('substitute.range').visual() end,
            mode = 'x',
        },

        {
            '<leader>x',
            function() require('substitute.exchange').operator() end,
        },
        {
            'x',
            function() require('substitute.exchange').visual() end,
            mode = 'x',
        },
    },
    config = function()
        -- yanky.nvim integration
        require('substitute').setup {
            on_substitute = require('yanky.integration').substitute(),
            highlight_substituted_text = {
                enabled = true,
                timer = 300,
            },
        }
    end,
}

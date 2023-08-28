return {
    'gbprod/substitute.nvim',
    keys = {
        { 'k', function() require('substitute').operator() end },
        { 'kk', function() require('substitute').line() end },
        { 'k$', function() require('substitute').eol() end },
        { 'k', function() require('substitute').visual() end, mode = 'x' },
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
            '<leader>xx',
            function() require('substitute.exchange').line() end,
        },
        {
            'x',
            function() require('substitute.exchange').visual() end,
            mode = 'x',
        },
        {
            '<leader>xc',
            function() require('substitute.exchange').cancel() end,
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

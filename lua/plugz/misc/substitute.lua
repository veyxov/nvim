return {
    'gbprod/substitute.nvim',
    keys = {
        { 'r', function() require('substitute').operator() end },
        { 'rr', function() require('substitute').line() end },
        { 'r$', function() require('substitute').eol() end },
        { 'r', function() require('substitute').visual() end, mode = 'x' },

        {
            'rs',
            function() require('substitute.range').operator() end,
        },
        {
            'rs',
            function() require('substitute.range').visual() end,
            mode = 'x',
        },
        {
            'rss',
            function() require('substitute.range').word() end,
        },

        {
            '<leader>x',
            function() require('substitute.exchange').operator() end,
        },
    },
    config = function()
        -- yanky.nvim integration
        require('substitute').setup {
            on_substitute = require('yanky.integration').substitute(),
        }
    end,
}

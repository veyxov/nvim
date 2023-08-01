return {
    'gbprod/substitute.nvim',
    keys = {
        { '_', function() require('substitute').operator() end },
        { '__', function() require('substitute').line() end },
        { '_$', function() require('substitute').eol() end },
        { '_', function() require('substitute').visual() end, mode = 'x' },
    },
    config = function()
        -- yanky.nvim integration
        require('substitute').setup {
            on_substitute = require('yanky.integration').substitute(),
        }
    end,
}

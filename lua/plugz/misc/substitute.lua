return {
    'gbprod/substitute.nvim',
    keys = {
        { 'r', function() require('substitute').operator() end },
        { 'rr', function() require('substitute').line() end },
        { 'r$', function() require('substitute').eol() end },
        { 'r', function() require('substitute').visual() end, mode = 'x' },
    },
    config = function()
        -- yanky.nvim integration
        require('substitute').setup {
            on_substitute = require('yanky.integration').substitute(),
        }
    end,
}

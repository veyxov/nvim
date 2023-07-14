return {
    'nvim-neotest/neotest',
    keys = {
        {
            'n',
            'ytd',
            function() require('neotest').run.run { strategy = 'dap' } end,
        },
        {
            'n',
            'ytr',
            function() require('neotest').run.run() end,
        },
    },
    dependencies = {
        {
            'Issafalcon/neotest-dotnet',
        },
    },
    config = function()
        require('neotest').setup {
            adapters = {
                require 'neotest-dotnet',
            },
        }
    end,
}

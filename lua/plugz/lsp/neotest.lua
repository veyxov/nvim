return {
    'nvim-neotest/neotest',
    lazy = false,
    init = function()
        local neotest = function() return require 'neotest' end

        local set = vim.keymap.set

        set(
            'n',
            'ytd',
            function() neotest().run.run { strategy = 'dap' } end,
            { desc = 'Debug test under cursor' }
        )
        set(
            'n',
            'ytr',
            function() neotest().run.run() end,
            { desc = 'Run nearest test' }
        )
        set(
            'n',
            'yts',
            function() neotest().run.run { suite = true } end,
            { desc = 'Run test suite' }
        )
        set(
            'n',
            '<leader>tt',
            function() neotest().output_panel.toggle() end,
            { desc = 'Toggle test output' }
        )
        set(
            'n',
            '<leader>tw',
            function() neotest().output.open { enter = true } end,
            { desc = 'Open test output' }
        )
        set(
            'n',
            'ytt',
            function() neotest().run.run(vim.fn.expand '%') end,
            { desc = 'Run unit tests in current file' }
        )
    end,
    dependencies = {
        {
            'Issafalcon/neotest-dotnet',
            lazy = false,
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

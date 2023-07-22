return {
    'aaronhallaert/advanced-git-search.nvim',
    keys = {
        { '<leader>gs', '<cmd>AdvancedGitSearch<cr>' },
    },
    config = function()
        require('telescope').load_extension 'advanced_git_search'
    end,
    dependencies = {
        {
            'tpope/vim-rhubarb',
            cmd = 'GBrowse',
            keys = {
                { '<leader>gg', '<cmd>GBrowse<cr>' },
            },
            config = function()
                require('lazy').load { plugins = { 'vim-fugitive' } }
            end,
        },
    },
}

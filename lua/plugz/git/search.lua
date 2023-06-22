return {
    'aaronhallaert/advanced-git-search.nvim',
    keys = {
        { '<leader>gs', '<cmd>AdvancedGitSearch<cr>' },
    },
    config = function()
        require('telescope').load_extension 'advanced_git_search'
    end,
    dependencies = {
        'tpope/vim-rhubarb',
        'sindrets/diffview.nvim',
    },
}


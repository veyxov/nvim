local map = require('globals').Map

local Gitsigns = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
        local gs = require 'gitsigns'
        gs.setup { yadm = { enable = true } }

        -- Add/reset
        map('jj', gs.stage_hunk)
        map('ju', gs.reset_hunk)
        map('jJ', gs.stage_buffer)
        map('jU', gs.reset_buffer)

        map('gh', gs.next_hunk)

        map('jj', function()
            gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'v')
        map('ju', function()
            gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'v')


        map('hb', function()
            gs.blame_line { full = true }
        end)
    end,
}

local Fugitive = {
    'tpope/vim-fugitive',
    cmd = 'G',
    init = function()
        map('J', '<cmd>G add . | G commit<cr>')
        map('jc', '<cmd>G commit<cr>')
        map('jb', '<cmd>G blame<cr>')

        map('jp', '<cmd>G! push<cr>')
        map('ja', '<cmd>G add .<cr>') -- stage all files
    end,
}

local Search = {
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

return {
    Gitsigns,
    Fugitive,
    Search,
}

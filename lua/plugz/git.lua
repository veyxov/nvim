local map = require('globals').Map

local Gitsigns = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
        local gs = require 'gitsigns'
        gs.setup { yadm = { enable = true } }

        -- Hunk stage
        map('jj', gs.stage_hunk)
        map('ju', gs.reset_hunk)

        map('gh', gs.next_hunk)

        map('hs', function()
            gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'v')
        map('hr', function()
            gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'v')

        --map('ha', gs.stage_buffer)
        map('hU', gs.stage_buffer)

        map('hb', function()
            gs.blame_line { full = true }
        end)
    end,
}

local Fugitive = {
    'tpope/vim-fugitive',
    cmd = 'G',
    init = function()
        map('gac', '<cmd>G add . | G commit<cr>')
        --map('gc', '<cmd>G commit<cr>')
        --map('gb', '<cmd>G blame<cr>')

        --map('gP', '<cmd>G! push<cr>')
        --map('ga', '<cmd>G add .<cr>') -- stage all files
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

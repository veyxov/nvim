return {
    'tpope/vim-fugitive',
    cmd = 'G',
    init = function()
        local map = require('globals').Map

        map('J', '<cmd>G add . | G commit<cr>')
        map('jc', '<cmd>G commit<cr>')
        map('jb', '<cmd>G blame<cr>')

        map('jp', '<cmd>G! push<cr>')
        map('ja', '<cmd>G add .<cr>') -- stage all files
    end,
}


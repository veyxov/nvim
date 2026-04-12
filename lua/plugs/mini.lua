vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})

require 'mini.icons'.setup()

require 'mini.files'.setup({
    mappings = {
        close       = 'qu',
        go_in       = '',
        go_in_plus  = '<right>',
        go_out      = '<left>',
        go_out_plus = '',
        synchronize = '<cr>',
    },
}
)
map('-', function() MiniFiles.open() end)

require 'mini.pick'.setup()
map('<leader>t', function() MiniPick.builtin.files() end)
map('<leader>g', function() MiniPick.builtin.grep_live() end)

require 'mini.ai'.setup()

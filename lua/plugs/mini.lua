vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})

require 'mini.basics'.setup()

require 'mini.icons'.setup()

require 'mini.files'.setup({
  mappings = {
    close       = 'qu',
    go_in       = '',
    go_in_plus  = '<right>',
    go_out      = '<left>',
    go_out_plus = '',
    synchronize = '<cr>',
  }
})
map('-', function() MiniFiles.open() end)

require 'mini.pick'.setup()
map('<leader>t', function() MiniPick.builtin.files() end)
map('<leader>g', function() MiniPick.builtin.grep_live() end)

require 'mini.ai'.setup()

require 'mini.pairs'.setup()

require 'mini.surround'.setup({
  mappings = {
    add = 'ya',
    delete = 'ds',
    replace = 'cs',

    find = 'yn',
    find_left = 'yp',
    highlight = 'yh'
  }
})

require('mini.jump2d').setup({
  labels = "etaoinshrdlcumwfgypbvkjxqz",
  view = {
    dim = true,
    n_steps_ahead = 2,
  }
})
map('s', function()
  MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
  end, { 'o', 'x', 'n' }
)

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
  },
}
)
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



local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    --
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

require 'plugs.mini.jump2d'

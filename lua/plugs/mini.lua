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
  labels = 'etaioshrdlc',
  view = {
    dim = true,
    n_steps_ahead = 1,
  }
})
map('s', function()
  MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
  end, { 'o', 'x', 'n' }
)

require 'mini.jump'.setup({
  mappings = {
    forward = 'f',
    backward = 'F',
    -- can't use these, because using t as the second Leader key
    forward_till = '',
    backward_till = '',
  },
})

require 'mini.operators'.setup({
  replace = { prefix = 'r' },
  multiply = { prefix = 'gl' },
  exchange = { prefix = 'gt' }
})

-- currently slow...
-- require 'mini.animate'.setup()


require 'mini.statusline'.setup()
require 'mini.tabline'.setup()
require 'mini.indentscope'.setup()

require 'mini.trailspace'.setup()
map('<leader>ds', function() MiniTrailspace.trim(); MiniTrailspace.trim_last_lines(); end)

require 'mini.starter'.setup()

require 'mini.splitjoin'.setup({mappings = {toggle = 'S'}})

require 'mini.bracketed'.setup()

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

require 'mini.cmdline'.setup();

require 'mini.diff'.setup {
  view = {
      style = 'sign',
      signs = {add = '│', change = '│', delete = '_'},
  }
}

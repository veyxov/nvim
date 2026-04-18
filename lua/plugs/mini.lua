-- vim: foldmethod=marker foldlevel=0
vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})

--{{{basics
require('mini.basics').setup({
  options = { extra_ui = true, win_borders = 'solid' },
  autocommands = { basic = false } -- disable startinsert on term for kitty
})
require 'mini.icons' .setup()
--}}}

--{{{ files
require 'mini.files'.setup({
  mappings = {
    close       = 'qu',
    go_in_plus  = '<right>',
    go_out_plus = '<left>',
    synchronize = '<cr>',
  }
})
map('-', function() MiniFiles.open() end)
--}}}

--{{{ picker
require 'mini.pick'.setup {
  mappings = {
    choose_in_split   = '<C-x>',
    choose_in_vsplit  = '<C-v>',
    choose_marked     = '<C-d>',

    mark     = '<C-s>',
    refine = '<C-n>'
  },
  options = {use_cache = true}
}
map('<leader>t', function() MiniPick.builtin.files() end)
map('<leader>g', function() MiniPick.builtin.grep_live() end)
--}}}

--{{{edit
require 'mini.ai'       .setup()
require 'mini.pairs'    .setup()
require 'mini.splitjoin'.setup({mappings = {toggle = 'S'}})
require 'mini.bracketed'.setup()
require 'mini.align'    .setup()
--}}}

--{{{surround
require 'mini.surround'.setup({
  mappings    = {
    add       = 'ya',
    delete    = 'ds',
    replace   = 'cs',

    find      = 'yn',
    find_left = 'yp',
    highlight = 'yh'
  }
})
--}}}

--{{{ jump2d
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
--}}}

--{{{jump
require 'mini.jump'.setup({
  mappings = {
    forward       = 'f',
    backward      = 'F',
    -- can't use these, because using t as the second Leader key
    forward_till  = '',
    backward_till = '',
  },
})
--}}}

--{{{operators
require 'mini.operators'.setup({
  replace  = { prefix = 'r' },
  multiply = { prefix = 'gl' },
  exchange = { prefix = 'gt' }
})
--}}}

--{{{ui
-- require 'mini.starter'    .setup()
require 'mini.statusline' .setup()
require 'mini.tabline'    .setup()
require 'mini.indentscope'.setup()
require 'mini.trailspace' .setup()
require 'mini.cmdline'    .setup()
require 'mini.diff'       .setup()
map('<leader>ds', function() MiniTrailspace.trim(); MiniTrailspace.trim_last_lines(); end)
--}}}

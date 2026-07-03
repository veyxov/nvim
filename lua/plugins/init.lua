autocmd('PackChanged', 'pack', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind ~= 'delete' then
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add({
  { src = gh('nvim-mini/mini.nvim') },
  { src = gh('nvim-treesitter/nvim-treesitter') },
  { src = gh('nvim-treesitter/nvim-treesitter-textobjects') },
  { src = gh('sindrets/diffview.nvim') },
  { src = gh('mistweaverco/kulala.nvim') },
  { src = gh('zbirenbaum/copilot.lua') },
})

require 'plugins.mini'
require 'plugins.treesitter'
require 'plugins.dotnet'
require 'plugins.diffview'
require 'plugins.kulala'
require 'plugins.copilot'

vim.cmd.colorscheme 'wildcharm'

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
  { src = gh('nvim-treesitter-textobjects') },
})

require 'plugins.mini'
require 'plugins.treesitter'
require 'plugins.dotnet'

vim.cmd.colorscheme 'miniwinter'

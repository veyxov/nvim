local o = vim.opt

o.cmdheight = 0
o.laststatus = 3
o.wrap = false

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.shiftround = true

o.swapfile = false

o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldlevel = 3

local disabled_builtins = {
  'gzip',    'tar',           'tarPlugin',     'zip',               'zipPlugin',    'getscript', 'getscriptPlugin',
  'vimball', 'vimballPlugin', 'matchit',       'matchparen',        '2html_plugin', 'logiPat',   'rrhelper',
  'netrw',   'netrwPlugin',   'netrwSettings', 'netrwFileHandlers', 'spellfile_plugin', 'tutor_mode_plugin',
  'remote_plugins', 'nvim_net_plugin', 'man'
}
-- still there: treesitter, shada_plugin, 'clipboard_provider'

require 'vim._core.ui2'.enable()
for _, plugin in ipairs(disabled_builtins) do
  print(vim.g['loaded_' .. plugin])
  vim.g['loaded_' .. plugin] = 1
end


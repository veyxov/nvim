_G.Cfg = {}

require 'vim._core.ui2'.enable()

vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

_G.Cfg.map = function(l, r, m, o)
    m = m or 'n'
    o = o or { silent = true }
    vim.keymap.set(m, l, r, o)
end
_G.Cfg.lnmap = function(l, r) vim.keymap.set('n', '<Leader>' .. l, r) end
_G.Cfg.lxmap = function(l, r) vim.keymap.set('x', '<Leader>' .. l, r) end

local misc = require 'mini.misc'
Cfg.now = function(f) misc.safely('now', f) end
Cfg.later = function(f) misc.safely('later', f) end
Cfg.on_event = function(ev, f) misc.safely('event:' .. ev, f) end
Cfg.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end

local gr = vim.api.nvim_create_augroup('custom-config', {})
Cfg.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

vim.cmd 'colorscheme miniwinter'

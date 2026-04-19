_G.Cfg = {}

require 'vim._core.ui2'.enable()

vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
vim.pack.add({ 'https://github.com/nvim-lua/plenary.nvim' })

_G.Cfg.map = function(l, r, m, o)
    m = m or 'n'
    o = o or { silent = true }
    vim.keymap.set(m, l, r, o)
end
_G.Cfg.lnmap = function(l, r) _G.Cfg.map('<leader>' .. l, r) end
_G.Cfg.cmap = function(l, r) _G.Cfg.map(l, '<cmd>' .. r .. '<cr>') end

local misc = require 'mini.misc'
Cfg.now = function(f) misc.safely('now', f) end
Cfg.later = function(f) misc.safely('later', f) end
Cfg.on_event = function(ev, f) misc.safely('event:' .. ev, f) end
Cfg.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end
Cfg.now_if_args = vim.fn.argc(-1) > 0 and Cfg.now or Cfg.later

local gr = vim.api.nvim_create_augroup('custom-config', {})
Cfg.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

Cfg.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then return end
    if not ev.data.active then vim.cmd.packadd(plugin_name) end
    callback(ev.data)
  end
  Cfg.new_autocmd('PackChanged', '*', f, desc)
end

vim.cmd 'colorscheme miniwinter'

vim.loader.enable()
local disabled_builtins = {
        'gzip',    'tar',           'tarPlugin',     'zip',               'zipPlugin',    'getscript', 'getscriptPlugin',
        'vimball', 'vimballPlugin', 'matchit',       'matchparen',        '2html_plugin', 'logiPat',   'rrhelper',
        'netrw',   'netrwPlugin',   'netrwSettings', 'netrwFileHandlers', 'spellfile_plugin', 'tutor_mode_plugin',
        'remote_plugins', 'nvim_net_plugin', 'man'
} -- still there: treesitter, shada_plugin, 'clipboard_provider'
for _, plugin in ipairs(disabled_builtins) do
        vim.g['loaded_' .. plugin] = 1
end

_G.Cfg = {}

vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
vim.pack.add({ 'https://github.com/nvim-lua/plenary.nvim' })

_G.Cfg.map = function(l, r, m, o)
    m = m or 'n'
    o = o or { silent = true }
    vim.keymap.set(m, l, r, o)
end
_G.Cfg.lnmap = function(l, r) _G.Cfg.map('<leader>' .. l, r) end
_G.Cfg.cmap = function(l, r) _G.Cfg.map(l, '<cmd>' .. r .. '<cr>') end
_G.Cfg.lncmap = function(l, r) _G.Cfg.cmap('<leader>' .. l, r) end

local misc = require 'mini.misc'
Cfg.now = function(f) misc.safely('now', f) end
Cfg.later = function(f) misc.safely('later', f) end
Cfg.on_event = function(ev, f) misc.safely('event:' .. ev, f) end
Cfg.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end
Cfg.now_if_args = vim.fn.argc(-1) > 0 and Cfg.now or Cfg.later

Cfg.gr = vim.api.nvim_create_augroup('xyz', {})
Cfg.au = function(ev, opts)
  vim.api.nvim_create_autocmd(ev, vim.tbl_extend('keep', opts, { group = Cfg.gr }))
end

vim.cmd 'colorscheme miniwinter'

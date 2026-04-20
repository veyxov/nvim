local o = vim.o

Cfg.now(function()
        require 'mini.basics'.setup({
                options = { extra_ui = true },
                autocommands = { basic = false }
        })
end)

o.swapfile = false
o.undofile = true
o.shada = "'20,<50,s10,h"

o.cmdheight = 0
o.laststatus = 3

o.expandtab = true

local disabled_builtins = {
        'gzip',    'tar',           'tarPlugin',     'zip',               'zipPlugin',    'getscript', 'getscriptPlugin',
        'vimball', 'vimballPlugin', 'matchit',       'matchparen',        '2html_plugin', 'logiPat',   'rrhelper',
        'netrw',   'netrwPlugin',   'netrwSettings', 'netrwFileHandlers', 'spellfile_plugin', 'tutor_mode_plugin',
        'remote_plugins', 'nvim_net_plugin', 'man'
} -- still there: treesitter, shada_plugin, 'clipboard_provider'
for _, plugin in ipairs(disabled_builtins) do
        vim.g['loaded_' .. plugin] = 1
end

Cfg.au('TextYankPost', { pattern = '*', callback = function() vim.highlight.on_yank() end })

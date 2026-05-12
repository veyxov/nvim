local o = vim.o

vim.g.mapleader = ' '
o.swapfile = false
o.undofile = true
o.shada = "'20,<50,s10,h"

o.cmdheight = 0
o.laststatus = 3
o.cursorline = true

o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4

o.ignorecase = true
o.smartcase = true

o.updatetime = 250
o.timeoutlen = 225

Cfg.au('TextYankPost', { pattern = '*', callback = function() vim.highlight.on_yank() end })

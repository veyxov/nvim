local o = vim.o

vim.g.mapleader = ' '
o.swapfile = false
o.undofile = true
o.shada = "'20,<50,s10,h"

o.cmdheight = 0
o.laststatus = 3

o.expandtab = true

Cfg.au('TextYankPost', { pattern = '*', callback = function() vim.highlight.on_yank() end })

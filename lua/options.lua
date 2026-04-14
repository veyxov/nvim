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

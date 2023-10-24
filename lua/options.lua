local o = vim.opt

vim.g.mapleader = ' '

o.termguicolors = true
o.hlsearch = false
o.wrap = false
o.breakindent = true

-- Nice splitting
o.splitkeep = 'screen'

-- Allow empty-space selection in v-block mode
o.virtualedit = 'block'

o.list = true
o.listchars = {
    trail = '·',
    nbsp = '␣',
    tab = '->',
}

o.swapfile = false
o.undolevels = 1000
o.undofile = true

-- Minimal status line
o.cmdheight = 0
o.laststatus = 0

-- smartcase
o.ignorecase = true
o.smartcase = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Tabs or spaces?
local tabs = 4
o.expandtab = true
o.tabstop = tabs
o.shiftwidth = tabs
o.softtabstop = tabs

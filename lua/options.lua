local o = vim.opt

---@diagnostic disable-next-line: inject-field
vim.g.mapleader = ' '

o.wrap = false

-- Allow empty-space selection in v-block mode
o.virtualedit = 'block'

o.list = true
o.listchars = {
    trail = '·',
    nbsp = '␣',
    tab = '->',
}

o.swapfile = false

o.cmdheight = 0
o.laststatus = 3

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

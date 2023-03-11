vim.g.mapleader = ' '

-- Rich terminal colors.
vim.o.termguicolors = true

vim.o.mouse = ''

vim.o.virtualedit = 'block'

-- Visual clutter
vim.o.wrap = false
vim.opt.list = true
vim.o.hlsearch = true
vim.wo.signcolumn = 'number'

-- Backup, undo
vim.o.swapfile = false
vim.o.undofile = true

-- Hide status bar
vim.o.ruler = false
vim.o.showmode = false
vim.o.cmdheight = 0
vim.o.laststatus = 3

vim.o.shortmess = 'aItFOW'

-- Smart case search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Completion
vim.o.updatetime = 250
vim.opt.wildmode = 'longest:full,full'
vim.o.completeopt = 'menuone,noselect'

-- tabs settings
local tabs = 4
vim.o.tabstop = tabs;
vim.o.expandtab = true
vim.o.shiftwidth = tabs;
vim.o.softtabstop = tabs;

vim.diagnostic.config({
    virtual_text = { prefix = "●" },
    underline = true,
})

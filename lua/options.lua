-- Splaceship
vim.g.mapleader = ' '

-- Nice and juicy terminal colors.
vim.o.termguicolors = true

-- What is a mouse? Don't know, don't care.
vim.o.mouse = ''

-- Allow empty-space selection in v-block mode
vim.o.virtualedit = 'block'

-- Train your fingers to be faster, stronger, better...
vim.opt.timeoutlen = 200

-- Visual clutter
vim.o.wrap = false
vim.opt.list = true
vim.o.hlsearch = true
vim.wo.signcolumn = 'number'
vim.opt.colorcolumn = "80"

-- Too risky? Nah, it'll be fine :)
vim.o.swapfile = false
vim.o.undofile = true

-- Minimal visual clutter.
vim.o.ruler = false
vim.o.showmode = false
vim.o.cmdheight = 0
vim.o.laststatus = 3

vim.opt.formatoptions = "jcroqlnt"
vim.o.shortmess = 'aItFOW'

-- Work smarter not harder.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Fast completion and diagnostic.
vim.o.updatetime = 250
vim.opt.wildmode = 'longest:full,full'
vim.o.completeopt = 'menuone,noselect'

-- Tabs or spaces?
local tabs = 4
vim.o.expandtab = true
vim.o.tabstop = tabs;
vim.o.shiftwidth = tabs;
vim.o.softtabstop = tabs;

-- Beautiful circle for buggy situations.
vim.diagnostic.config({ virtual_text = { prefix = "●" }, })

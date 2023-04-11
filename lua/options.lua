local opt = vim.opt

-- Spaceship
vim.g.mapleader = ' '

-- Nice and juicy terminal colors.
opt.termguicolors = true

-- What is a mouse? Don't know, don't care.
opt.mouse = ''

-- Nice splitting
opt.splitkeep = 'screen'

-- Show current command in status line
opt.showcmdloc = 'statusline'
opt.statusline = " %f %= %S "

-- Allow empty-space selection in v-block mode
opt.virtualedit = 'block'

-- Train your fingers to be faster, stronger, better...
opt.timeoutlen = 150

-- Visual clutter
opt.wrap = false
opt.list = true
opt.hlsearch = true
opt.signcolumn = 'number'

-- Too risky? Nah, it'll be fine :)
opt.swapfile = false
opt.undolevels = 10000
opt.undofile = true

-- Minimal visual clutter.
opt.ruler = false
opt.showmode = false
opt.cmdheight = 0
opt.laststatus = 3

opt.formatoptions = "jcroqlnt"
opt.shortmess:append { W = true, I = true, c = true }

-- Work smarter not harder.
opt.ignorecase = true
opt.smartcase = true

-- Fast completion and diagnostic.
opt.updatetime = 200
opt.wildmode = 'longest:full,full'
opt.completeopt = 'menuone,noselect'

-- Tabs or spaces?
-- Tabs or spaces?
local tabs = 4
opt.expandtab = true
opt.tabstop = tabs;
opt.shiftwidth = tabs;
opt.softtabstop = tabs;

-- Beautiful circle for buggy situations.
vim.diagnostic.config({ virtual_text = { prefix = "●" }, })

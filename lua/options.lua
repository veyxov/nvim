local opt = vim.opt

-- Spaceship
vim.g.mapleader = ' '

-- Nice and juicy terminal colors.
opt.termguicolors = true

-- What is a mouse? Don't know, don't care.
opt.mouse = ''

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
opt.undofile = true

-- Minimal visual clutter.
opt.ruler = false
opt.showmode = false
opt.cmdheight = 0
opt.laststatus = 0

opt.formatoptions = "jcroqlnt"
opt.shortmess = 'aItFOW'

-- Work smarter not harder.
opt.ignorecase = true
opt.smartcase = true

-- Fast completion and diagnostic.
opt.updatetime = 250
opt.wildmode = 'longest:full,full'
opt.completeopt = 'menuone,noselect'

-- Tabs or spaces?
opt.expandtab = true

-- Beautiful circle for buggy situations.
vim.diagnostic.config({ virtual_text = { prefix = "●" }, })

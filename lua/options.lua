local opt = vim.opt

-- Spaceship
vim.g.mapleader = ' '

-- Nice terminal colors.
opt.termguicolors = true

-- Nice splitting
opt.splitkeep = 'screen'

-- Allow empty-space selection in v-block mode
opt.virtualedit = 'block'

-- Need to type chords fast
opt.timeoutlen = 250

-- Visual clutter
opt.wrap = false
opt.list = true
opt.listchars = {
    tab = '→ ',
    trail = '·',
    extends = '▶',
    precedes = '◀',
    nbsp = '␣',
}
opt.hlsearch = true

opt.swapfile = false
opt.undolevels = 1000
opt.undofile = true

-- Minimal status line
opt.cmdheight = 0
opt.laststatus = 3

opt.formatoptions = 'jcroqlnt'
-- Avoid "Hit Enter to continue"
opt.shortmess = 'aOtTAIFS'

-- Work smarter not harder.
opt.ignorecase = true
opt.smartcase = true

-- Fast completion and diagnostic.
opt.updatetime = 500
opt.wildmode = 'longest:full,full'
opt.completeopt = 'menu,menuone,preview'

-- Tabs or spaces?
local tabs = 4
opt.expandtab = true
opt.tabstop = tabs
opt.shiftwidth = tabs
opt.softtabstop = tabs

-- Beautiful circle for buggy situations.
vim.diagnostic.config { virtual_text = { prefix = '●' } }

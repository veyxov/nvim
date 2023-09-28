local o = vim.opt

vim.g.mapleader = ' '

o.termguicolors = true

-- Nice splitting
o.splitkeep = 'screen'

-- Allow empty-space selection in v-block mode
o.virtualedit = 'block'

-- Need to type chords fast
o.timeoutlen = 500

-- Visual clutter
o.wrap = false

o.list = true
o.listchars = {
    tab = '→ ',
    trail = '·',
    extends = '▶',
    precedes = '◀',
    nbsp = '␣',
}

-- Nice diff chars, for diffview.nvim
o.fillchars:append { diff = '╱' }

o.hlsearch = true

o.swapfile = false
o.undolevels = 1000
o.undofile = true

-- Minimal status line
o.cmdheight = 0
o.laststatus = 3

o.formatoptions = 'jcroqlnt'

-- Short, sweet and to the point.
o.shortmess = 'aoOtTWAIqF'

-- Work smarter not harder.
o.ignorecase = true
o.smartcase = true

-- Fast completion and diagnostic.
o.updatetime = 500

-- Tabs or spaces?
local tabs = 4
o.expandtab = true
o.tabstop = tabs
o.shiftwidth = tabs
o.softtabstop = tabs

-- Beautiful circle for buggy situations.
vim.diagnostic.config { virtual_text = { prefix = '●' } }

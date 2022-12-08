-- Lua filetype detection
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

-- Set highlight on search
vim.o.hlsearch = false

-- Disable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Don't wrap
vim.o.wrap = false

-- Disable swap
vim.o.swapfile = false

-- Save undo history
vim.o.undofile = true

-- Hide status bar
vim.o.cmdheight = 0
vim.o.laststatus = 0

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'number'

-- tabs settings
local tabs = 4
vim.o.tabstop = tabs;
vim.o.softtabstop = tabs;
vim.o.shiftwidth = tabs;

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable builtin plugins.
local builtin_plugins = {
	'gzip', 'matchparen', 'matchit', 'netrwPlugin',
	'shada', 'tarPlugin', 'tohtml',
	'tutor', 'zipPlugin',
}
for _, plugin in ipairs(builtin_plugins) do
	vim.g['loaded_' .. plugin] = 1
end

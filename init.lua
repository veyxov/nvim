local o = vim.opt

-- [[ options
o.cursorline = true

o.undofile = true
o.writebackup = false
o.swapfile = false

o.cmdheight = 0;
o.laststatus = 3

o.ignorecase = true;
o.smartcase = true
o.hlsearch = false

o.wrap = false
o.showmode = false

o.updatetime = 225
o.timeoutlen = 225
o.redrawtime = 10000

local tabs = 4
o.tabstop = tabs
o.shiftwidth = tabs
o.softtabstop = tabs
o.expandtab = true
o.autoindent = true
o.shiftround = true
-- ]]

-- [[ autocmds
local g = vim.api.nvim_create_augroup('xyz', { clear = true })
local function autocmd(event, callback)
  vim.api.nvim_create_autocmd(event, {
    callback = callback,
    group = g,
  })
end
autocmd('TextYankPost', function() vim.highlight.on_yank() end)
--]]

-- [[ maps
vim.g.mapleader = ' '

local map = require('globals').Map
map('<leader>w', '<cmd>wall<cr>')
map('<C-W><C-W>', '<cmd>q<cr>');map('qu', '<cmd>wq<cr>')
-- ctrl+v is for paste in my terminal, so this is how to enter the block-visual mode
map('<leader>v', '<C-V>')

-- yank key y -> h
map('h', 'y', { 'n', 'v', 'x'})
map('hh', 'yy')
map('H', 'y$')
map('<leader>h', '"+y', {'n', 'v', 'x'})
map('<leader>hh', '"+yy')
--]]

vim.diagnostic.config {
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = false,
    virtual_lines = { only_current_line = true },
    jump = { float = true },
}

require 'lazyopt'

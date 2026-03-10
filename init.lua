local o = vim.opt
vim.g.mapleader = ' '

-- [[ options
o.swapfile = false
o.cmdheight = 0; o.laststatus = 3
o.ignorecase = true;o.smartcase = true
o.hlsearch = false
o.wrap = false
o.updatetime = 250
o.timeoutlen = 250
o.scrolloff = 10
o.undofile = true
o.cursorline = true
o.termguicolors = true
o.showmode = false
o.shortmess:append("c")
local tabs = 4;o.expandtab = true;o.tabstop = tabs;o.shiftwidth = tabs;o.softtabstop = tabs
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
local map = require('globals').Map
map('<leader>w', '<cmd>wall<cr>')
map('<C-W><C-W>', '<cmd>q<cr>');map('qu', '<cmd>wq<cr>')
map('<C-Down>', '<C-w><Down>');map('<C-Left>', '<C-w><Left>');map('<C-Right>', '<C-w><Right>');map('<C-Up>', '<C-w><Up>')
map('<leader>v', '<C-V>')
map('<Esc>', '<cmd>nohl<cr>')

-- yank key y -> h
map('h', 'y', { 'n', 'v', 'x'})
map('hh', 'yy')
map('H', 'y$')
map('<leader>h', '"+y', {'n', 'v', 'x'})
map('<leader>hh', '"+yy')

map('<leader>n', ':cnext<cr>');
map('<leader>p', ':cprev<cr>');
--]]

vim.diagnostic.config {
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = false,
    virtual_lines = { only_current_line = true },
    jump = { float = true },
}

require 'lazyopt'

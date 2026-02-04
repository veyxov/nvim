local o = vim.opt
vim.g.mapleader = ' '

o.swapfile = false
o.cmdheight = 0; o.laststatus = 3
o.ignorecase = true;o.smartcase = true
o.wrap = false
local tabs = 4;o.expandtab = true;o.tabstop = tabs;o.shiftwidth = tabs;o.softtabstop = tabs

local function autocmd(event, callback)
    vim.api.nvim_create_autocmd(event, { callback = callback, group = vim.api.nvim_create_augroup('xyz', {}) })
end
autocmd('TextYankPost', function() vim.highlight.on_yank() end)

local map = require('globals').Map
map('<leader>w', '<cmd>wall<cr>')
map('<Backspace>', '<cmd>q<cr>');map('qu', '<cmd>wq<cr>');map('<leader>q', '<cmd>qall!<cr>')
map('<C-Down>', '<C-w><Down>');map('<C-Left>', '<C-w><Left>');map('<C-Right>', '<C-w><Right>');map('<C-Up>', '<C-w><Up>')
map('<leader>v', '<C-V>')
map('<Esc>', ':nohl<CR>:echo<CR>')

map('h', 'y', { 'n', 'v', 'x'})
map('hh', 'yy')
map('H', 'y$')

map('<leader>h', '"+y', {'n', 'v', 'x'})
map('<leader>hh', '"+yy')

map('<leader>n', ':cnext<cr>');
map('<leader>p', ':cprev<cr>');

require 'lazyopt'

vim.diagnostic.config {
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_lines = true,
  jump = { float = true },
}

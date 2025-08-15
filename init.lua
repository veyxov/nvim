local o = vim.opt
vim.g.mapleader = ' '

o.swapfile = false
o.cmdheight = 0; o.laststatus = 3
o.ignorecase = true;o.smartcase = true
local tabs = 4;o.expandtab = true;o.tabstop = tabs;o.shiftwidth = tabs;o.softtabstop = tabs

local function autocmd(event, callback)
    vim.api.nvim_create_autocmd(event, { callback = callback, group = vim.api.nvim_create_augroup('xyz', {}) })
end
autocmd('TextYankPost', function() vim.highlight.on_yank() end)

local map = require('globals').Map
map('<leader>s', '<cmd>wall<cr>')
map('<Backspace>', '<cmd>q<cr>');map('qu', '<cmd>wq<cr>');map('<leader>q', '<cmd>qall!<cr>')
map('<C-Down>', '<C-w><Down>');map('<C-Left>', '<C-w><Left>');map('<C-Right>', '<C-w><Right>');map('<C-Up>', '<C-w><Up>')
map('<leader>v', '<C-V>')
map('<Esc>', ':nohl<CR>:echo<CR>')

map('h', 'y', { 'n', 'v'})
map('hh', 'yy')
map('H', 'y$')
map('<leader>h', '"+y', {'n', 'v'})
map('<leader>hh', '"+yy')
map('<leader>H', '"+y$')

map('<leader>n', '<cmd>cnext<cr>zz')

require 'lazyopt'

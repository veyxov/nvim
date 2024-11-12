-- The Big Bang
local o = vim.opt
vim.g.mapleader = ' '

o.list = true;o.listchars = { trail = '·', nbsp = '␣', tab = '->' }
o.swapfile = false
o.wrap = false
o.cmdheight = 0;o.laststatus = 3
o.ignorecase = true;o.smartcase = true
local tabs = 4;o.expandtab = true;o.tabstop = tabs;o.shiftwidth = tabs;o.softtabstop = tabs

local GROUP = vim.api.nvim_create_augroup('VEYXOV_GROUP', {})
local function autocmd(event, callback)
    vim.api.nvim_create_autocmd(event, { callback = callback, group = GROUP })
end
autocmd('TextYankPost', function() vim.highlight.on_yank() end)

-- Go to last loc when opening a buffer
autocmd('BufReadPost', function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
end)

local map = require('globals').Map
map('<leader>s', '<cmd>wall<cr>')
map('<C-H>', '<cmd>q<cr>');map('qu', '<cmd>wq<cr>');map('<leader>q', '<cmd>qall!<cr>')
map('<C-Down>', '<C-w><Down>');map('<C-Left>', '<C-w><Left>');map('<C-Right>', '<C-w><Right>');map('<C-Up>', '<C-w><Up>')
map('<leader>v', '<C-V>')
map('<Esc>', ':nohl<CR>:echo<CR>')

map('<leader>n', '<cmd>cnext<cr>zz')

require 'lazyopt'

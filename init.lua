-- [[ options
local o = vim.opt

o.cursorline = true

o.undofile = true
o.swapfile = false

o.cmdheight = 0;
o.laststatus = 3

o.ignorecase = true;
o.smartcase = true

o.wrap = false
o.showmode = false

o.updatetime = 225
o.timeoutlen = 225

local tabs = 4
o.tabstop = tabs
o.shiftwidth = tabs
o.softtabstop = tabs
o.expandtab = true
o.shiftround = true
-- ]]

-- [[ autocmds
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('xyz', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
--]]

-- [[ maps
vim.g.mapleader = ' '

local map = require('globals').Map
map('<leader>w', '<cmd>wall<cr>')
map('<C-W><C-W>', '<cmd>q<cr>');map('qu', '<cmd>wq<cr>')
-- ctrl+v is for paste in my terminal, so this is how to enter the block-visual mode
map('<leader>v', '<C-V>')

-- yank key y -> h
map('h', 'y', { 'n', 'v', 'x'}); map('hh', 'yy')
map('<leader>h', '"+y', {'n', 'v', 'x'}); map('<leader>hh', '"+yy')

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')
map('n', 'nzzzv')
map('N', 'Nzzzv')

map('<A-Up>', ':m .-2<cr>==')
map('<A-Down>', ':m .+1<cr>==')
map('<A-Down>', ":m '>+1<cr>gv=gv", {'v'})
map('<A-Up>', ":m '<-2<cr>gv=gv", {'v'})

map('<', '<gv', {'v'})
map('>', '>gv', {'v'})

map('==', function() vim.fn.system(string.format('wl-copy --type text/uri-list "file://%s"', vim.fn.expand('%:p'))) end)
--]]

vim.diagnostic.config {
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = false,
    virtual_lines = { only_current_line = true },
    jump = { float = true },
}

require 'lazyopt'

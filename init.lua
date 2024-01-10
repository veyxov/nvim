-- The Big Bang
local o = vim.opt
local g = vim.g
g.mapleader = ' '
g.editorconfig = false
o.wrap = false
o.virtualedit = 'block'
o.list = true
o.listchars = {
    trail = '·',
    nbsp = '␣',
    tab = '->',
}
o.swapfile = false
o.cmdheight = 0
o.laststatus = 3
o.ignorecase = true
o.smartcase = true
o.updatetime = 250
o.timeoutlen = 300
local tabs = 4
o.expandtab = true
o.tabstop = tabs
o.shiftwidth = tabs
o.softtabstop = tabs

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
map('ge', '<cmd>lua vim.diagnostic.goto_next()<cr>')
map('<leader>s', '<cmd>wall<cr>') -- Save file
map('<C-H>', '<cmd>q<cr>') -- fast quit
-- Quitting made easy
map('qu', '<cmd>wq<cr>')
map('<leader>q', '<cmd>qall!<cr>')
-- Window navigation
map('<C-Down>', '<C-w><Down>')
map('<C-Left>', '<C-w><Left>')
map('<C-Right>', '<C-w><Right>')
map('<C-Up>', '<C-w><Up>')
-- Add undo break-points
map(',', ',<c-g>u', 'i')
map('.', '.<c-g>u', 'i')
map(';', ';<c-g>u', 'i')
map('<leader>v', '<C-V>') -- Visual block mode
-- better indenting
map('<', '<gv', 'v')
map('>', '>gv', 'v')
-- TODO: Use this more
map('fl', '1z=') -- Fix Word Under Cursor
-- TODO: Find a way to eliminate the "hit enter" prompts
-- NOTE: noice.nvim solves this problem, but installing a plugin for this...
map('<Esc>', ':nohl<CR>:echo<CR>') -- Clear
-- Quickfix mappings
map('<leader>cn', ':cnext<cr>zz')

-- switch between multiple quickfix lists
map('<leader>co', ':colder<cr>zz')
map('<leader>cn', ':cnewer<cr>zz')

require 'lazyopt'

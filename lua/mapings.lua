local map = require('globals').Map

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

map('H', 'y$')

-- TODO: add some mappings to the now unused y

-- better indenting
map('<', '<gv', 'v')
map('>', '>gv', 'v')

-- fix spelling errors

-- TODO: Use this more
map('fl', '1z=') -- Fix Word Under Cursor

-- TODO: Find a way to eliminate the "hit enter" prompts
-- NOTE: noice.nvim solves this problem, but installing a plugin for this...
map('<Esc>', ':nohl<CR>:echo<CR>') -- Clear

-- Quickfix mappings
map('<leader>cn', ':cnext<cr>zz')

map('gh', '$', { 'x', 'o' })
map('ga', '0', { 'x', 'o' })

map('yw', '<C-W>', 'i')

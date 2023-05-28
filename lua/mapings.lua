local map = require 'globals'.Map

-- Quitting made easy
map('<leader>qu', '<cmd>qall!<cr>')
map('qu', '<cmd>wq<cr>')
map('<bs>', '<cmd>q<cr>')


-- Window navigation
map('<C-Down>', '<C-w><Down>')
map('<C-Left>', '<C-w><Left>')
map('<C-Right>', '<C-w><Right>')
map('<C-Up>', '<C-w><Up>')

-- Add undo break-points
map(',', ',<c-g>u', 'i')
map('.', '.<c-g>u', 'i')
map(';', ';<c-g>u', 'i')

map('<C-w>', '<cmd>wall<cr>') -- Save file
map('<leader>w', '<cmd>wall<cr>') -- Save file

-- Select and copy
map('<leader>y', '"+y', { 'n', 'v' }) -- Copy to system clipboar
map('<leader>v', '<C-V>')             -- Visual block mode

-- Reduce sfb when yanking
map("hh", "yy")
map("ha", "ya")
map("hi", "yi")
map("he", "ye")
map("hw", "yw")

-- Teporary solution for muscle memory
map("ya", "da")

-- Insert a semicolon at the end of the line and create a new one
map('<C-o>', '<esc>A;<esc>o', 'i')

-- better indenting
map("<", "<gv", 'v')
map(">", ">gv", 'v')

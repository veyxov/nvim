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
vim.cmd "map h y"
vim.cmd "map H Y"
map('<leader>h', '"+y', { 'n', 'v', 'o' })
map('<leader>hh', '"+yy', { 'n', 'v', 'o' })
map('<leader>v', '<C-V>')             -- Visual block mode

-- Insert a semicolon at the end of the line and create a new one
map('<C-o>', '<esc>A;<esc>o', 'i')

-- better indenting
map("<", "<gv", 'v')
map(">", ">gv", 'v')

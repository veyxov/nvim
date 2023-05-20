local map = require 'globals'.Map

map('<leader>qu', '<cmd>qall!<cr>')
map('qu', '<cmd>wq<cr>')
map('<bs>', '<cmd>q<cr>')

-- Pairing
map('{{', '<space>{<cr>}<esc>O', 'i')
map('((', '()<space>{<cr>}<esc>O', 'i')


-- Window navigation
map('<C-Down>', '<C-w><Down>')
map('<C-Left>', '<C-w><Left>')
map('<C-Right>', '<C-w><Right>')
map('<C-Up>', '<C-w><Up>')

-- Add undo break-points
map(',', ',<c-g>u', 'i')
map('.', '.<c-g>u', 'i')
map(';', ';<c-g>u', 'i')

map('<leader>w', '<cmd>wall<cr>') -- Save file

-- Select and copy
map('<leader>y', '"+y', { 'n', 'v' }) -- Copy to system clipboar
map('<leader>v', '<C-V>')             -- Visual block mode

map("hi", "yi")

-- Insert a semicolon at the end of the line and create a new one
map('<C-o>', '<esc>A;<esc>o', 'i')

-- better indenting
map("<", "<gv", 'v')
map(">", ">gv", 'v')

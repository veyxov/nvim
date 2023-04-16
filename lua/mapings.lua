local map = require 'globals'.Map

map('<leader>Q', '<cmd>qall!<cr>') -- Force quit
map('<cr>q', '<cmd>q<cr>')         -- Close buffer

map('<C-a>', '<esc>ggVG', 'i')     -- Select all

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

-- Splitting
map('<C-e>', function()
    local keys = vim.api.nvim_replace_termcodes('<C-w>s', true, true, true);
    vim.api.nvim_feedkeys(keys, 'n', true)
    vim.opt.laststatus = 3
end)                          -- split

map('<cr>w', '<cmd>wall<cr>') -- Save file

-- Select and copy
map('<leader>y', '"+y', { 'n', 'v' }) -- Copy to system clipboar
map('<leader>v', '<C-V>')             -- Visual block mode

-- Insert a semicolon at the end of the line and create a new one
map('<C-o>', '<esc>A;<esc>o', 'i')

-- better indenting
map("<", "<gv", 'v')
map(">", ">gv", 'v')

vim.cmd [[map z l]] -- folds using l

local map = vim.keymap.set

map('n', '<leader>Q', '<cmd>qall!<cr>') -- Force quit
map('n', '<cr>q', '<cmd>q<cr>')         -- Close buffer

map('i', '<C-a>', '<esc>ggVG')          -- Select all

-- Pairing
map('i', '{{', '<space>{<cr>}<esc>O')
map('i', '((', '()<space>{<cr>}<esc>O')


-- Window navigation
map('n', '<C-Down>', '<C-w><Down>')
map('n', '<C-Left>', '<C-w><Left>')
map('n', '<C-Right>', '<C-w><Right>')
map('n', '<C-Up>', '<C-w><Up>')

-- Splitting
map('n', '<C-e>', '<C-w>s')        -- split
map('n', '<C-i>', '<C-w>v')        -- split-v

map('n', '<cr>w', '<cmd>wall<cr>') -- Save file

-- Select and copy
map({ 'n', 'v' }, '<leader>y', '"+y') -- Copy to system clipboar
map('n', '<leader>v', '<C-V>')        -- Visual block mode

map("n", "ll", "<cmd>Lazy<cr>")

-- Insert a semicolon at the end of the line and create a new one
map('i', '<C-o>', '<esc>A;<esc>o')

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

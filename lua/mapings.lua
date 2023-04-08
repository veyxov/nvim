vim.keymap.set('n', '<leader>Q', '<cmd>qall!<cr>') -- Force quit
vim.keymap.set('n', '<cr>q', '<cmd>q<cr>')         -- Close buffer

vim.keymap.set('i', '<C-a>', '<esc>ggVG')          -- Select all

-- Pairing
vim.keymap.set('i', '{{', '<space>{<cr>}<esc>O')
vim.keymap.set('i', '((', '()<space>{<cr>}<esc>O')


-- Window navigation
vim.keymap.set('n', '<C-Down>', '<C-w><Down>')
vim.keymap.set('n', '<C-Left>', '<C-w><Left>')
vim.keymap.set('n', '<C-Right>', '<C-w><Right>')
vim.keymap.set('n', '<C-Up>', '<C-w><Up>')

-- Splitting
vim.keymap.set('n', '<C-e>', '<C-w>s')        -- split
vim.keymap.set('n', '<C-i>', '<C-w>v')        -- split-v

vim.keymap.set('n', '<cr>w', '<cmd>wall<cr>') -- Save file

-- Select and copy
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- Copy to system clipboar
vim.keymap.set('n', '<leader>v', '<C-V>')        -- Visual block mode

vim.keymap.set("n", "ll", "<cmd>Lazy<cr>")

-- Insert a semicolon at the end of the line and create a new one
vim.cmd [[inoremap <C-O> <esc>A;<esc>o]]

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

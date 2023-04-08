vim.keymap.set('n', '<leader>Q', '<cmd>qall!<cr>') -- Force quit
vim.keymap.set('n', '<cr>q', '<cmd>q<cr>')         -- Close buffer

vim.keymap.set('i', '<C-a>', '<esc>ggVG')          -- Select all

vim.keymap.set('i', '{{', '<space>{<cr>}<esc>O')
vim.keymap.set('i', '((', '<space>()<space>{<cr>}<esc>O')

vim.keymap.set('n', '<cr>w', '<cmd>wall<cr>')    -- Save file

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- Copy to system clipboar
vim.keymap.set('n', '<leader>v', '<C-V>')        -- Visual block mode

vim.keymap.set("n", "ll", "<cmd>Lazy<cr>")

-- Insert a semicolon at the end of the line and create a new one
vim.cmd [[inoremap <C-O> <esc>A;<esc>o]]

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

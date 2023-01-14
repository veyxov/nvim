vim.keymap.set('n', '<leader>Q', '<cmd>qall!<cr>') -- Force quit
vim.keymap.set('n', '<cr>w', '<cmd>wall<cr>') -- Save file ***
vim.keymap.set('n', '<cr>q', '<cmd>q<cr>') -- Close buffer **
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- Copy to system clipboar
vim.keymap.set('n', '<leader>v', '<C-V>') -- Copy to system clipboar

vim.keymap.set('n', '<c-s>', ":silent !tmux neww 'lazygit; exit'<CR>") -- Open git manager **

vim.keymap.set("n", "ls", "<cmd>Lazy sync<cr>")
vim.keymap.set("n", "ll", "<cmd>Lazy<cr>")

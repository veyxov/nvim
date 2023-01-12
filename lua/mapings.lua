vim.keymap.set('n', '<leader>Q', '<cmd>qall!<cr>') -- Force quit
vim.keymap.set('n', '<cr>w', '<cmd>wall<cr>') -- Save file ***
vim.keymap.set('n', '<cr>q', '<cmd>q<cr>') -- Close buffer **
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- Copy to system clipboar
vim.keymap.set('n', '<leader>v', '<C-V>') -- Copy to system clipboar

vim.keymap.set('n', '<c-g>', ":silent !tmux neww 'lazygit; exit'<CR>") -- Open git manager **

-- New, experimental stuff
vim.keymap.set("n", "<cr>cw", function() vim.fn.jobstart("setwall")end)

vim.keymap.set("n", "ls", "<cmd>Lazy sync<cr>")
vim.keymap.set("n", "ll", "<cmd>Lazy<cr>")

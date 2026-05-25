if vim.g.loaded_sql_ftplug then return end
vim.g.loaded_sql_ftplug = true

vim.pack.add({
        'https://github.com/MunifTanjim/nui.nvim',
        'https://github.com/kndndrj/nvim-dbee',
})

require('dbee').setup()

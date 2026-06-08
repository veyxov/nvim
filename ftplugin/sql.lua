if vim.g.loaded_sql_ftplug then return end
vim.g.loaded_sql_ftplug = true

vim.pack.add({
        gh('MunifTanjim/nui.nvim'),
        gh('kndndrj/nvim-dbee'),
})

require('dbee').setup()

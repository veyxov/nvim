if vim.g.loaded_http_ftplug then return end
vim.g.loaded_http_ftplug = true

vim.pack.add({ gh('mistweaverco/kulala.nvim') })

require('kulala').setup({
        global_keymaps = true,
        global_keymaps_prefix = '<leader>R',
        kulala_keymaps_prefix = '',
})

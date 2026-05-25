if vim.g.loaded_go_ftplug then return end
vim.g.loaded_go_ftplug = true

vim.pack.add({ 'https://github.com/ray-x/guihua.lua' })
vim.pack.add({ 'https://github.com/ray-x/go.nvim' })

require('go').setup()
vim.lsp.config.gopls = require('go.lsp').config()
vim.lsp.enable('gopls')

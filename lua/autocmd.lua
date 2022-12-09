-- Automatically source and re-compile packer whenever you save this init.lua
local GROUP = vim.api.nvim_create_augroup('VEYXOV_GROUP', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = GROUP,
  pattern = 'plugins.lua',
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = GROUP,
  pattern = '*',
})


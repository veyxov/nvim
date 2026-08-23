vim.lsp.config('harper_ls', {
  cmd = { 'harper-ls', '--stdio' },
  filetypes = { 'markdown', 'gitcommit', 'text' },
})
vim.lsp.enable('harper_ls')

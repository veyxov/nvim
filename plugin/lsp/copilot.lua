local version = tostring(vim.version())

vim.lsp.config('copilot', {
  cmd = { 'copilot-language-server', '--stdio' },
  root_markers = { '.git' },
  init_options = {
    editorInfo = { name = 'Neovim', version = version },
    editorPluginInfo = { name = 'Neovim', version = version },
  },
})
vim.lsp.enable('copilot')
vim.lsp.inline_completion.enable()

vim.keymap.set('i', '<Right>', function()
  if not vim.lsp.inline_completion.get() then return '<Right>' end
end, { expr = true, replace_keycodes = true, desc = 'Accept Copilot suggestion' })

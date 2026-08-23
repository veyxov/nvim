vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'clippy' },
      cargo = { features = 'all' },
      inlayHints = {
        closureReturnTypeHints = { enable = 'with_block' },
        parameterHints = { enable = true },
        typeHints = { enable = true },
      },
    },
  },
})
vim.lsp.enable('rust_analyzer')

autocmd('LspAttach', 'rust-inlay-hints', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == 'rust_analyzer' then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

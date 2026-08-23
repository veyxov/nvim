local function apply_system_colorscheme()
  vim.cmd.colorscheme(vim.o.background == 'dark' and 'wildcharm' or 'peachpuff')
end

apply_system_colorscheme()
autocmd('OptionSet', 'system-appearance', { pattern = 'background', callback = apply_system_colorscheme })

-- format on save with whatever lsp client attached (roslyn/easy-dotnet); no-op if none support it
autocmd('BufWritePre', 'fmt', {
  callback = function(a) vim.lsp.buf.format({ bufnr = a.buf, timeout_ms = 1000 }) end,
})

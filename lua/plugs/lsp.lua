vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'cs', 'sln' },
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/GustavEikaas/easy-dotnet.nvim',
    })
    require 'easy-dotnet'.setup ()

    require 'mini.completion'.setup()
  end
})

vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
    source = "if_many",
    prefix = "●",
    virt_text_pos = "eol",
    hl_mode = "combine",
  },
})

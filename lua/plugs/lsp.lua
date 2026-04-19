vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'cs', 'sln' },
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/GustavEikaas/easy-dotnet.nvim',
    })
    require 'easy-dotnet'.setup ()
  end
})

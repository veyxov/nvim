autocmd('FileType', 'kulala', {
  pattern = 'http',
  once = true,
  callback = function()
    require 'kulala'.setup({ global_keymaps = true })
  end,
})

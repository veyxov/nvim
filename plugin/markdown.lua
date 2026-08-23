autocmd('FileType', 'kulala', {
  pattern = 'md',
  once = true,
  callback = function()
      require'render-markdown'.setup {}
  end,
})

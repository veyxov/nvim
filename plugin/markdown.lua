pack 'MeanderingProgrammer/render-markdown.nvim'

autocmd('FileType', 'md', {
  pattern = 'md',
  once = true,
  callback = function()
      require'render-markdown'.setup {}
  end,
})

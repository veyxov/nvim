vim.pack.add({ { src = gh('MeanderingProgrammer/render-markdown.nvim') } })

autocmd('FileType', 'kulala', {
  pattern = 'md',
  once = true,
  callback = function()
      require'render-markdown'.setup {}
  end,
})

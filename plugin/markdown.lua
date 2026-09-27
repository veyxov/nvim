pack('MeanderingProgrammer/render-markdown.nvim', { load = false })

autocmd('FileType', 'markdown', {
  pattern = { 'markdown', 'md' },
  once = true,
  callback = function()
      vim.cmd.packadd 'render-markdown.nvim'
      require 'render-markdown'.setup {}
  end,
})

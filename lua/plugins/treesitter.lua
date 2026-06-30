require 'nvim-treesitter'.install({
  'lua', 'luadoc', 'vim', 'vimdoc', 'query',
  'c_sharp', 'markdown', 'markdown_inline', 'json', 'yaml', 'toml', 'bash', 'diff', 'sql',
})

autocmd('FileType', 'ts', {
  callback = function(args) pcall(vim.treesitter.start, args.buf) end,
})

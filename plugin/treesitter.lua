vim.pack.add({
  { src = gh('nvim-treesitter/nvim-treesitter') },
  { src = gh('nvim-treesitter/nvim-treesitter-textobjects') },
})

autocmd('PackChanged', 'pack', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind ~= 'delete' then
      vim.cmd 'TSUpdate'
    end
  end,
})

later(function()
  require 'nvim-treesitter'.install({
    'lua', 'luadoc', 'vim', 'vimdoc', 'query',
    'c_sharp', 'rust', 'markdown', 'markdown_inline', 'json', 'yaml', 'toml', 'bash', 'diff', 'sql',
  })
end)

autocmd('FileType', 'ts', {
  callback = function(args) pcall(vim.treesitter.start, args.buf) end,
})

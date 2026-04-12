vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
require('nvim-treesitter').setup({
  highlight = { enable = true },
  indent = { enable = true },
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.pack.add({'https://github.com/nvim-lua/plenary.nvim'})
vim.pack.add {'https://github.com/mistweaverco/kulala.nvim'}

require 'kulala'.setup({
  global_keymaps = true,
  global_keymaps_prefix = "<leader>R",
  kulala_keymaps_prefix = ""
})

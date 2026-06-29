-- vim.pack: update all `:lua vim.pack.update()`, one `:lua vim.pack.update({"name"})`
vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim", version = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("plugins.mini")
require("plugins.treesitter")

-- mini.nvim ships these: minicyan miniwinter miniautumn minispring minisummer randomhue
vim.cmd.colorscheme("miniwinter")

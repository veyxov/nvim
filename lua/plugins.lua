require("lazy").setup("plugz", {
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin", },
    },
  },
  debug = true,
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")

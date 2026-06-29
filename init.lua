vim.loader.enable()
require("globals")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

disable({
  "loaded_netrw", "loaded_netrwPlugin", "loaded_tarPlugin", "loaded_zipPlugin",
  "loaded_gzip", "loaded_2html_plugin", "loaded_tutor_mode_plugin",
}, 1)
disable({
  "loaded_python3_provider", "loaded_ruby_provider",
  "loaded_perl_provider", "loaded_node_provider",
}, 0)

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("plugins")

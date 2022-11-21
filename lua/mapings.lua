local Map = require 'globals'.Map
local Cmd = require 'globals'.Cmd

Map("<leader>y", '"+y')
Map("<leader>p", '"+p')
Map("<leader>q", Cmd "q")
Map("<leader>Q", Cmd "qall!")
Map("<leader>w", Cmd "wall")

Map("<C-h>", "<C-V>")

-- Lsp
Map("ls", Cmd "LspStart")
Map("la", Cmd "Lspsaga code_action")

-- Spectre
Map("hg", Cmd "lua require('spectre').open()")

-- First select the region, unselect and run range_code_action
Map("la", string.format("%s %s", "<ESC>", Cmd "Lspsaga range_code_action"), "v")
Map("li", Cmd "lua vim.lsp.buf.implementation()")
Map("ld", Cmd "lua vim.lsp.buf.definition()")
Map("lD", Cmd "lua vim.lsp.buf.declaration()")
Map("lf", Cmd "Lspsaga lsp_finder")
Map("lF", Cmd "lua vim.lsp.buf.format({async = true})")
Map("lr", Cmd "Lspsaga rename")
Map("<C-K>", Cmd "Lspsaga hover_doc")

-- Pages
Map("<PageUp>", "<C-U>")
Map("<PageDown>", "<C-D>")

-- Toggle terminal
Map("<C-T>", Cmd "Lspsaga open_floaterm")
Map("<C-T>", Cmd "Lspsaga close_floaterm", "t")

-- Git
Map('<C-G>', Cmd "silent !tmux neww 'lazygit; exit'")

-- Harpoon
Map("<C-N>", Cmd [[lua require("harpoon.mark").add_file()]])
Map("\\", Cmd [[lua require("harpoon.ui").toggle_quick_menu()]])

-- Telescope
Map("hf", Cmd "Telescope find_files")
Map("hh", Cmd "Telescope help_tags")
Map("hc", Cmd "Telescope colorscheme")

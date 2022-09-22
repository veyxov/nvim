local Map = require 'globals'.Map
local Cmd = require 'globals'.Cmd

Map("<leader>y", '"+y')
Map("<leader>q", Cmd "q")
Map("<leader>w", Cmd "wall")

-- Lsp
Map("<S-Enter>", Cmd "Lspsaga code_action")
-- First select the region, unselect and run range_code_action
Map("<A-Enter>", string.format("%s %s", "<ESC>", Cmd "Lspsaga range_code_action"), "v")
Map("li", Cmd "lua vim.lsp.buf.implementation()")
Map("ld", Cmd "lua vim.lsp.buf.definition()")
Map("lD", Cmd "lua vim.lsp.buf.declaration()")
Map("lf", Cmd "Lspsaga lsp_finder")
Map("lF", Cmd "lua vim.lsp.buf.format({async = true})")
Map("lr", Cmd "Lspsaga rename")
Map("pd", Cmd "Lspsaga preview_definition")

Map("<C-h>", "<C-V>")

Map("<C-K>", Cmd "Lspsaga hover_doc")

-- Toggle terminal
Map("<C-T>", Cmd "Lspsaga open_floaterm")
Map("<C-T>", Cmd "Lspsaga close_floaterm", "t")

-- Movement between tabs
Map("<leader>n", Cmd "tabprevious")
Map("<leader>o", Cmd "tabnext")

-- Packer
Map("<leader>ps", Cmd "PackerSync")

-- Tree
Map("\\", Cmd "Neotree toggle right")
Map("<leader>\\", Cmd "Neotree toggle show buffers right")

-- Git
Map("<C-G>", Cmd [[lua require("harpoon.tmux").sendCommand(1, "lazygit status ; exit\n")]])

-- Twilight
Map("<leader><cr>", Cmd "TZAtaraxis")

Map("<C-n>", "<Plug>luasnip-next-choice", "i")
Map("<C-n>", "<Plug>luasnip-next-choice", "s")
Map("<C-p>", "<Plug>luasnip-prev-choice", "i")
Map("<C-p>", "<Plug>luasnip-prev-choice", "s")

-- Telescope
Map("hf", Cmd "Telescope find_files")
Map("hg", Cmd "Telescope live_grep")
Map("hh", Cmd "Telescope help_tags")
Map("hc", Cmd "Telescope colorsheme")

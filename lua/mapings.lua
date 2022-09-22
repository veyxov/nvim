local Map = require 'globals'.Map
local Cmd = require 'globals'.Cmd

Map ("<leader>y", '"+y')
Map ("<leader>q",  Cmd "q")
Map ("<leader>w",  Cmd "wall")

-- Lsp
Map ("<S-Enter>",  Cmd "Lspsaga code_action")
-- First select the region, unselect and run range_code_action
Map ("<A-Enter>",  string.format("%s %s","<ESC>" ,Cmd "Lspsaga range_code_action"), "v")
Map ("<leader>li", Cmd "lua vim.lsp.buf.implementation()")
Map ("<leader>ld", Cmd "lua vim.lsp.buf.definition()")
Map ("<leader>lD", Cmd "lua vim.lsp.buf.declaration()")
Map ("<leader>lf", Cmd "Lspsaga lsp_finder")
Map ("<leader>lF", Cmd "lua vim.lsp.buf.formatting()")
Map ("<leader>lr", Cmd "Lspsaga rename")
Map ("<leader>pd", Cmd "Lspsaga preview_definition")

Map ("<C-h>", "<C-V>")

Map ("<C-K>",      Cmd "Lspsaga hover_doc")
Map ("<C-T>",      Cmd "Lspsaga open_floaterm")
Map ("<C-T>",      Cmd "Lspsaga close_floaterm", "t")

Map("<C-c>", Cmd ":%y+") -- copy whole file content

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
Map("<leader>ff", Cmd "Telescope find_files")
Map("<leader>fg", Cmd "Telescope live_grep")
Map("<leader>fh", Cmd "Telescope help_tags")
Map("<leader>fc", Cmd "Telescope colorsheme")

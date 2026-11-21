vim.g.mapleader = ' '
vim.o.swapfile = false
vim.cmd.colorscheme 'catppuccin'
vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }
require 'mini.basics'.setup { mappings = { basic = false } }
require 'mini.pick'.setup()
require 'mini.files'.setup { mappings = { go_in = '<Right>', go_out = '<Left>' }, options = { permanent_delete = false } }
vim.keymap.set('n', '-', function() if not MiniFiles.close() then MiniFiles.open() end end)
for lhs, rhs in pairs { ['<leader>t'] = 'Pick files', ['<leader>fl'] = 'Pick grep_live', ['<leader>w'] = 'wa', qu = 'wq' } do vim.keymap.set('n', lhs, '<cmd>' .. rhs .. '<cr>') end
for lhs, rhs in pairs { j = '[', k = ']', h = 'y', ['<leader>h'] = '"+y' } do vim.keymap.set({ 'n', 'x', 'o' }, lhs, rhs, { remap = true }) end

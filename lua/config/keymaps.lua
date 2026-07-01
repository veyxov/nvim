map('<Esc>', cmd 'nohlsearch')

map('<A-Down>', ":m '>+1<cr>gv=gv", 'v')
map('<A-Up>', ":m '<-2<cr>gv=gv", 'v')

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')
map('n', 'nzzzv')
map('N', 'Nzzzv')

map('<', '<gv', 'v')
map('>', '>gv', 'v')

lmap('w', cmd 'wa')
lmap('q', cmd 'q')

lmap('d', vim.diagnostic.open_float)

-- remaps based on my layout
local kmp = function(a, b) vim.keymap.set({ 'n', 'x', 'o' }, a, b, { remap = true }) end
-- jk -> []
kmp('j', '[')
kmp('k', ']')

-- h -> y
kmp('h', 'y')
kmp('<leader>h', '"+y')

map('<Esc>', cmd 'nohlsearch')

map('J', ":m '>+1<cr>gv=gv", 'v')
map('K', ":m '<-2<cr>gv=gv", 'v')

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')
map('n', 'nzzzv')
map('N', 'Nzzzv')

map('<', '<gv', 'v')
map('>', '>gv', 'v')

lmap('w', cmd 'wa')
lmap('q', cmd 'q')

map('<S-l>', cmd 'bnext')
map('<S-h>', cmd 'bprevious')

lmap('e', vim.diagnostic.open_float)
map('[d', function() vim.diagnostic.jump({ count = -1 }) end)
map(']d', function() vim.diagnostic.jump({ count = 1 }) end)

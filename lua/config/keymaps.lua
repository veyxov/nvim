map('<Esc>', cmd 'nohlsearch')

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')
map('n', 'nzzzv')
map('N', 'Nzzzv')

map('<', '<gv', 'v')
map('>', '>gv', 'v')

lmap('w', cmd 'wa')
map('qu', cmd 'wq')
lmap('qu', cmd 'q!')

lmap('?', vim.diagnostic.open_float)

-- remaps based on my layout
local kmp = function(a, b) vim.keymap.set({ 'n', 'x', 'o' }, a, b, { remap = true }) end
-- jk -> []
kmp('j', '[')
kmp('k', ']')

-- h -> y
kmp('h', 'y')
kmp('<leader>h', '"+y')

map('<A-Down>', ":m '>+1<cr>gv=gv", 'v')
map('<A-Up>', ":m '<-2<cr>gv=gv", 'v')

map('ta',  cmd 'lua vim.lsp.buf.code_action()')
map('tr',  cmd 'lua vim.lsp.buf.rename()')
map('ti' , cmd 'lua vim.lsp.buf.implementation()')
map('td' , cmd 'lua vim.lsp.buf.type_definition()')
map('tk' , cmd 'lua vim.lsp.buf.signature_help()')
map('tw' , cmd 'lua vim.lsp.buf.workspace_symbol()')
map('th' , cmd 'lua vim.lsp.buf.hover()')
map('tf' , cmd "Pick lsp scope='references'")
map('td' , cmd 'lua vim.lsp.buf.type_definition()')

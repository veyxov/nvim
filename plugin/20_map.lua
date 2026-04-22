local map, cmap, lnmap = Cfg.map, Cfg.cmap, Cfg.lnmap

cmap('<leader>w', 'wa')
cmap('qu', 'wq')

cmap('<C-W><C-W>', 'q');
-- ctrl+v is for paste in my terminal, so this is how to enter the block-visual mode
map('<leader>v', '<C-V>')

-- The ancient tradition of hjkl slumbers in a dedicated layer.
-- Here on the home row of Hands-Down-Gold, prime real estate is reborn:
-- 'h' becomes the harvester, 'j' and 'k' the gates of scope.
map('j', '[', { 'n', 'v', 'x' }, { remap = true, silent = true })
map('k', ']', { 'n', 'v', 'x' }, { remap = true, silent = true })
map('h', 'y', { 'n', 'v', 'x'}); map('hh', 'yy')
map('<leader>h', '"+y', {'n', 'v', 'x'}); map('<leader>hh', '"+yy')

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')
map('n', 'nzzzv')
map('N', 'Nzzzv')

-- Resize windows with Ctrl+Shift+arrows
cmap('<C-S-Up>', 'resize +2')
cmap('<C-S-Down>', 'resize -2')
cmap('<C-S-Left>', 'vertical resize -2')
cmap('<C-S-Right>', 'vertical resize +2')
-- Move lines up/down (Alt+j/k like VSCode)
map('<A-Up>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
map('<A-Down>', "<cmd>execute 'move .+' . v:count1<cr>==")
map('<', '<gv', 'v')
map('>', '>gv', 'v')

-- C-o is hard, maybe gl to go back?
cmap('t?', 'lua vim.diagnostic.open_float()')
cmap('ta', 'lua vim.lsp.buf.code_action()')
cmap('ti', 'lua vim.lsp.buf.implementation()')
cmap('th', 'lua vim.lsp.buf.hover()')
cmap('tl', 'lua vim.lsp.codelens.run()')
cmap('tc', 'lua vim.lsp.buf.rename()')
cmap('tR', 'lua vim.lsp.buf.references()')
cmap('ts', 'lua vim.lsp.buf.definition()')
cmap('td', 'lua vim.lsp.buf.type_definition()')
cmap('tr', 'Pick lsp scope="references"')
cmap('tf', 'lua vim.lsp.buf.format({ async = true })')

cmap('[p', 'exe "iput! " . v:register')
cmap(']p', 'exe "iput "  . v:register')
map('==', function() vim.fn.system(string.format("wl-copy --type text/uri-list 'file://%s'", vim.fn.expand('%:p'))) end)

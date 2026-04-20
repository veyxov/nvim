local map, cmap, lnmap = Cfg.map, Cfg.cmap, Cfg.lnmap
cmap('[p', 'exe "iput! " . v:register')
cmap(']p', 'exe "iput "  . v:register')

cmap('<leader>w', 'wa')
cmap('qu', 'wq')

map('<', '<gv', 'v')
map('>', '>gv', 'v')

cmap('<C-W><C-W>', 'q');
-- ctrl+v is for paste in my terminal, so this is how to enter the block-visual mode
map('<leader>v', '<C-V>')

-- yank key y -> h
map('h', 'y', { 'n', 'v', 'x'}); map('hh', 'yy')
map('<leader>h', '"+y', {'n', 'v', 'x'}); map('<leader>hh', '"+yy')

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')
map('n', 'nzzzv')
map('N', 'Nzzzv')

map('<leader>n', '<cmd>cnext<cr>zz')
map('<leader>N', '<cmd>cprev<cr>zz')

-- Resize windows with Ctrl+Shift+arrows
cmap('<C-S-Up>', 'resize +2')
cmap('<C-S-Down>', 'resize -2')
cmap('<C-S-Left>', 'vertical resize -2')
cmap('<C-S-Right>', 'vertical resize +2')

-- Move lines up/down (Alt+j/k like VSCode)
map('<A-Up>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
map('<A-Down>', "<cmd>execute 'move .+' . v:count1<cr>==")

-- Tab/Shift-Tab: Like browser tabs, feels natural
cmap('<Tab>', 'bnext')
cmap('<S-Tab>', 'bprevious')

map('==', function() vim.fn.system(string.format("wl-copy --type text/uri-list 'file://%s'", vim.fn.expand('%:p'))) end)

-- C-o is hard, maybe gl to go back?

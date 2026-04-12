function _G.map(l, r, m, o)
    m = m or 'n'
    o = o or { silent = true }
    vim.keymap.set(m, l, r, o)
end

vim.g.mapleader = ' '
map('<space>', '<Nop>')

map('<leader>w', '<cmd>wall<cr>')
map('qu', '<cmd>q<cr>')

map('<', '<gv', 'v')
map('>', '>gv', 'v')

map('<leader>xl', function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = 'Location List' })



map('<leader>xq', function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = 'Quickfix List' })

map('[q', vim.cmd.cprev)
map(']q', vim.cmd.cnext)

map('zv', 'zMzvzz', { desc = 'Close all folds except the current one' })
map('z<Down>', 'zcjzOzz', { desc = 'Close current fold when open. Always open next fold.' })
map('z<Up>', 'zckzOzz', { desc = 'Close current fold when open. Always open previous fold.' })
map('z0', '1z=', { desc = 'Fix word under cursor' })

-- [[ maps
map('<C-W><C-W>', '<cmd>q<cr>');map('qu', '<cmd>wq<cr>')
-- ctrl+v is for paste in my terminal, so this is how to enter the block-visual mode
map('<leader>v', '<C-V>')

-- yank key y -> h
map('h', 'y', { 'n', 'v', 'x'}); map('hh', 'yy')
map('<leader>h', '"+y', {'n', 'v', 'x'}); map('<leader>hh', '"+yy')

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')
map('n', 'nzzzv')
map('N', 'Nzzzv')

map('<', '<gv', 'v')
map('>', '>gv', 'v')

map('<leader>n', '<cmd>cnext<cr>zz')
map('<leader>N', '<cmd>cprev<cr>zz')

-- Resize windows with Ctrl+Shift+arrows
map('<C-S-Up>', '<cmd>resize +2<cr>')
map('<C-S-Down>', '<cmd>resize -2<cr>')
map('<C-S-Left>', '<cmd>vertical resize -2<cr>')
map('<C-S-Right>', '<cmd>vertical resize +2<cr>')

-- Move lines up/down (Alt+j/k like VSCode)
map('<A-Up>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
map('<A-Down>', "<cmd>execute 'move .+' . v:count1<cr>==")

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')

-- Tab/Shift-Tab: Like browser tabs, feels natural
map('<Tab>', '<cmd>bnext<cr>')
map('<S-Tab>', '<cmd>bprevious<cr>')

map('==', function() vim.fn.system(string.format("wl-copy --type text/uri-list 'file://%s'", vim.fn.expand('%:p'))) end)

-- C-o is hard, maybe gl to go back?
map('gl', '<C-O>')
map('gs', '<C-I>')

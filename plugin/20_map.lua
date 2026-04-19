local map, cmap, lnmap = Cfg.map, Cfg.cmap, Cfg.lnmap
-- Paste linewise before/after current line
-- Usage: `yiw` to yank a word and `]p` to put it on the next line.
cmap('[p', 'exe "iput! " . v:register')
cmap(']p', 'exe "iput "  . v:register')

cmap('<leader>w', 'wa')
cmap('qu', 'wq')

map('<', '<gv', 'v')
map('>', '>gv', 'v')

map('zv', 'zMzvzz', { desc = 'Close all folds except the current one' })
map('z<Down>', 'zcjzOzz', { desc = 'Close current fold when open. Always open next fold.' })
map('z<Up>', 'zckzOzz', { desc = 'Close current fold when open. Always open previous fold.' })
map('z0', '1z=', { desc = 'Fix word under cursor' })

-- [[ maps
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

map('<C-d>', '<C-d>zz')
map('<C-u>', '<C-u>zz')

-- Tab/Shift-Tab: Like browser tabs, feels natural
cmap('<Tab>', 'bnext')
cmap('<S-Tab>', 'bprevious')

map('==', function() vim.fn.system(string.format("wl-copy --type text/uri-list 'file://%s'", vim.fn.expand('%:p'))) end)

-- C-o is hard, maybe gl to go back?
-- map('gl', '<C-O>')
-- map('gs', '<C-I>')


local lsp = vim.lsp
map('th', function() lsp.buf.hover() end)
map('tr', function() lsp.buf.rename() end)
map('td', function() lsp.buf.definition() end)
map('tu', function() lsp.buf.references() end)
map('ta', function() lsp.buf.code_action() end)
map('tn', function() vim.diagnostic.goto_next() end)
map('t<space>', function() lsp.buf.implementation() end)

map('<leader>lg', function()
  vim.cmd 'tabnew'
  vim.fn.termopen('lazygit', {
    on_exit = function(_, code)
      if code == 0 then
        vim.cmd 'tabclose'
      end
    end,
  })
  vim.cmd 'startinsert'
end)

lnmap('ba', '<Cmd>b#<CR>')
lnmap('bs', function()
        vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end)


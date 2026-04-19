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


map('th', function() vim.lsp.buf.hover() end)
map('tr', function() vim.lsp.buf.rename() end)
map('td', function() vim.lsp.buf.definition() end)
map('tu', function() vim.lsp.buf.references() end)
map('ta', function() vim.lsp.buf.code_action() end)
map('tn', function() vim.diagnostic.goto_next() end)
map('t<space>', function() vim.lsp.buf.implementation() end)

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

--{{{lsp
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

--}}}
--

local pick_added_hunks_buf = 'Pick git_hunks path="%" scope="staged"'
local pick_workspace_symbols_live = 'Pick lsp scope="workspace_symbol_live"'

cmap('?b', 'Pick buffers')
cmap('?a', 'Pick git_hunks scope="staged"')
cmap('?A', pick_added_hunks_buf)
cmap('?c', 'Pick git_commits')
cmap('?d', 'Pick diagnostic scope="all"')
cmap('?D', 'Pick diagnostic scope="current"')
cmap('?f', 'Pick files')
--cmap('?G', 'Pick grep pattern="')
cmap('?h', 'Pick help')
cmap('?H', 'Pick hl_groups')
cmap('?r', 'Pick resume')
cmap('?/', 'Pick lsp scope="document_symbol"')
-- nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>',         'Commits (buf)')
-- nmap_leader('fl', '<Cmd>Pick buf_lines scope="all"<CR>',        'Lines (all)')
-- nmap_leader('fL', '<Cmd>Pick buf_lines scope="current"<CR>',    'Lines (buf)')
cmap('?gg', 'Pick git_hunks')
-- nmap_leader('fM', '<Cmd>Pick git_hunks path="%"<CR>',           'Modified hunks (buf)')
-- nmap_leader('fs', pick_workspace_symbols_live,                  'Symbols workspace (live)')
-- nmap_leader('fv', '<Cmd>Pick visit_paths cwd=""<CR>',           'Visit paths (all)')
-- nmap_leader('fV', '<Cmd>Pick visit_paths<CR>',                  'Visit paths (cwd)')

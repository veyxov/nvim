vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<cr>w', ':wall<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>y', '"+y')

vim.keymap.set('n', '<cr>g', ":silent !tmux neww 'lazygit; exit'<CR>")

vim.keymap.set('n', 'ho', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<cr>s', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', 'hh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', 'hg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', 'hd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist)

local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

nmap('lr', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('la', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('ld', vim.lsp.buf.definition, '[G]oto [D]efinition')
nmap('lD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('li', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
nmap('lf', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('lds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('lws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- See `:help K` for why this keymap
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help)

-- Lesser used LSP functionality
nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
nmap('lwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('lwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('lwl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

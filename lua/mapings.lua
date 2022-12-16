vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- What is this ?

vim.keymap.set('n', '<cr>w', ':wall<CR>') -- Save file ***
vim.keymap.set('n', '<cr>q', ':q<CR>') -- Close buffer **
vim.keymap.set('n', '<cr>Q', ':qall!<CR>') -- Force quit
vim.keymap.set('n', '<leader>y', '"+y') -- Copy to system clipboar

vim.keymap.set('n', '<c-g>', ":silent !tmux neww 'lazygit; exit'<CR>") -- Open git manager **

vim.keymap.set('n', '<cr>s', "<cmd>Telescope find_files<cr>", { desc = '[S]earch [F]iles' }) -- Fuzzy find files ****
vim.keymap.set('n', '<cr>f', "<cmd>Format<cr>", { desc = 'Format current file' }) -- Format code using LSP

vim.keymap.set('n', 'hh', "<cmd>Telescope help_tags<cr>", { desc = '[S]earch [H]elp' }) -- Seach in help
vim.keymap.set('n', '<cr>g', "<cmd>Telescope live_grep<cr>", { desc = '[S]earch by [G]rep' }) -- Grep search *
vim.keymap.set('n', 'hd', "<cmd>Telescope diagnostics<cr>", { desc = '[S]earch [D]iagnostics' }) -- Search in diagnostics
vim.keymap.set('n', '/', "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = '[S]earch [D]iagnostics' }) -- Search in diagnostics

-- Diagnostic keymaps
vim.keymap.set('n', 'dn', vim.diagnostic.goto_prev) -- Go to next problem/warning
vim.keymap.set('n', 'dN', vim.diagnostic.goto_next) -- Go to prev problem/warning
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float) -- Show full diagnostics for current line
vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist) -- Show list of diagnostics

vim.keymap.set('n', '<cr>r', "<cmd>Telescope lsp_references<cr>")
vim.keymap.set('n', '<cr>d', "<cmd>Telescope diagnostics<cr>", { desc = '[S]earch [D]iagnostics' }) -- Search in diagnostics

local nmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

nmap('lr', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<cr>a', vim.lsp.buf.code_action, '[C]ode [A]ction') -- ***

nmap('ld', vim.lsp.buf.definition, '[G]oto [D]efinition')
nmap('lD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('li', vim.lsp.buf.implementation, '[G]oto [I]mplementation') -- **

-- See `:help K` for why this keymap
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
vim.keymap.set('i', '<C-e>', vim.lsp.buf.signature_help)

-- Lesser used LSP functionality
nmap('lwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('lwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('lwl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

-- New, experimental stuff
vim.keymap.set("n", "<cr>cw", function() vim.fn.jobstart("setwall")end)

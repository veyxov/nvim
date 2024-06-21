-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Safely execute immediately
now(function()
  vim.o.termguicolors = true
  vim.g.mapleader = ' '
  vim.cmd('colorscheme retrobox')
end)

-- Safely execute later
later(function() 
	require('mini.ai').setup()
	vim.keymap.set('n', '?', '<cmd>Pick files<cr>')
end)

later(function() require('mini.surround').setup({
	mappings = {
		add = 'l', -- Add surrounding in Normal and Visual modes
		delete = 'ds', -- Delete surrounding
		find = 'sf', -- Find surrounding (to the right)
		find_left = 'sF', -- Find surrounding (to the left)
		highlight = 'lh', -- Highlight surrounding
		replace = 'cs', -- Replace surrounding
		update_n_lines = 'sn', -- Update `n_lines`

		suffix_last = 'l', -- Suffix to search with "prev" method
		suffix_next = 'n', -- Suffix to search with "next" method
	},
	search_method = 'cover_or_next',
}) end)
later(function() require('mini.pick').setup() end)
later(function() 
	require('mini.files').setup(
	{
		mappings = {
			go_in       = '<Return>',
			go_out      = '<C-H>',
			synchronize = '<leader>s',
			close       = 'q',
			go_in_plus  = 'L',
			go_out_plus = 'H',
			reveal_cwd  = '@',
			show_help   = 'g?',
			reset       = '<BS>',
			trim_left   = '<',
			trim_right  = '>',
		},
	}
	)

end)
later(function() require('mini.surround').setup() end)

-- Use external plugins with `add()`
now(function()
  -- Add to current session (install if absent)
  add('nvim-tree/nvim-web-devicons')
  require('nvim-web-devicons').setup()
end)

now(function()
  -- Supply dependencies near target plugin
  add({ source = 'neovim/nvim-lspconfig' })
end)

later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
  })
end)

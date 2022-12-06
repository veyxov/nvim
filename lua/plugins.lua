require('packer').startup(function(use)
	use {
		'wbthomason/packer.nvim',
		'nvim-lua/plenary.nvim'
	}

	use {
		'neovim/nvim-lspconfig',
		requires = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	}

	use { -- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp'
		},
	}

	use { -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup {
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<c-backspace>',
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						goto_next_end = {
							[']M'] = '@function.outer',
							[']['] = '@class.outer',
						},
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						goto_previous_end = {
							['[M'] = '@function.outer',
							['[]'] = '@class.outer',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
							['<leader>A'] = '@parameter.inner',
						},
					},
				},
			}

		end,
		event = "InsertEnter"
	}

	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	use {
		'sam4llis/nvim-tundra',
		config = function ()
			require('nvim-tundra').setup {}

			vim.opt.background = 'dark'
			vim.cmd('colorscheme tundra')
		end,
		event = "InsertEnter"
	}

	-- Fuzzy Finder
	use {
		'nvim-telescope/telescope.nvim',
		config = function()
			require('telescope').setup {
				extensions = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case"
				}
			}

			require('telescope').load_extension('fzf')
		end,
		after = 'telescope-fzf-native.nvim'
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
		cmd = "Telescope"
	}

	-- Keep cursor centered
	use {
		"arnamak/stay-centered.nvim",
		config = function()
			require("stay-centered")
		end,
		event = "InsertEnter"
	}

	-- EasyMotion
	use {
		'ggandor/leap.nvim',
		config = function()
			local leap = require 'leap'
			local lbls =  { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }


			leap.add_default_mappings()
			leap.opts.safe_labels = lbls
			leap.opts.labels = lbls
		end,
		keys = { 's', 'S' }
	}

	-- Better f/F
	use {
		'ggandor/flit.nvim',
		config = function()
			local lbls =  { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }

			-- Explicitly load leap.nvim
			vim.cmd ":PackerLoad leap.nvim"
			require('flit').setup {
				labeled_modes = "nvo",
				opts = {
					safe_labels = lbls,
					labels = lbls
				}
			}
		end,
		keys = { 'f', 'F', 't', 'T' },
		after = 'leap.nvim'
	}

	use {
		'ThePrimeagen/harpoon',
		config = function()
			vim.keymap.set('n', '(', function() require("harpoon.mark").add_file() end)
			vim.keymap.set('n', ')', function() require("harpoon.ui").toggle_quick_menu() end)
		end,
		keys = { '(', ')' }
	}

	-- File explorer
	use {
		"luukvbaal/nnn.nvim",
		config = function() require("nnn").setup() end
	}
end)

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
		run = function()
			pcall(require('nvim-treesitter.install').update {})
		end,
	}

	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	use {
		'sam4llis/nvim-tundra',
		config = function ()
			require('nvim-tundra').setup({
				transparent_background = false,
				dim_inactive_windows = {
					enabled = true,
					color = nil,
				},
				editor = {
					search = {},
					substitute = {},
				},
				syntax = {
					booleans = { bold = true, italic = true },
					comments = { bold = true, italic = true },
					conditionals = {},
					constants = { bold = true },
					fields = {},
					functions = {},
					keywords = {},
					loops = {},
					numbers = { bold = true },
					operators = { bold = true },
					punctuation = {},
					strings = {},
					types = { italic = true },
				},
				diagnostics = {
					errors = {},
					warnings = {},
					information = {},
					hints = {},
				},
				plugins = {
					lsp = true,
					treesitter = true,
					nvimtree = true,
					cmp = true,
					context = false,
					dbui = true,
					gitsigns = false,
					telescope = true,
				},
				overwrite = {
					colors = {},
					highlights = {},
				},
			})

			vim.opt.background = 'dark'
			vim.cmd('colorscheme tundra')
		end
	}

	-- Fuzzy Finder
	use {
		'nvim-telescope/telescope.nvim',
		config = function()
			require('telescope').setup {
				defaults = {
					mappings = {
						i = {
							['<C-u>'] = false,
							['<C-d>'] = false,
						},
					},
				},
				extensions = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case"
				}
			}

			require('telescope').load_extension('fzf')
		end
	}

	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

	-- Keep cursor centered
	use {
		"arnamak/stay-centered.nvim",
		config = function()
			require("stay-centered")
		end
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
		end
	}

	use {
		'ThePrimeagen/harpoon',
		config = function()
			vim.keymap.set('n', '(', function() require("harpoon.mark").add_file() end)
			vim.keymap.set('n', ')', function() require("harpoon.ui").toggle_quick_menu() end)
		end
	}

	-- Better f/F
	use {
		'ggandor/flit.nvim',
		config = function()
			local lbls =  { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }

			require('flit').setup {
				labeled_modes = "nvo",
				opts = {
					safe_labels = lbls,
					labels = lbls
				}
			}
		end
	}
end)

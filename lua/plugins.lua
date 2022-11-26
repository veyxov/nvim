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
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip', after = 'LuaSnip'
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

	use 'navarasu/onedark.nvim' -- Theme inspired by Atom

	-- Fuzzy Finder
	use {
		{ 'nvim-telescope/telescope.nvim'},
		{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
	}

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

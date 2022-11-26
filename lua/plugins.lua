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

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
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

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim' }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
end)

require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim', 'nvim-lua/plenary.nvim' }

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		requires = { {
			'williamboman/mason.nvim',
			after = "nvim-cmp",
			config = function()
				local on_attach = function(_, bufnr)
					vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
						if vim.lsp.buf.format then vim.lsp.buf.format()
						elseif vim.lsp.buf.formatting then vim.lsp.buf.formatting()
						end
					end, { desc = 'Format current buffer with LSP' })
				end

				require('mason').setup()

				local servers = { 'rust_analyzer', 'tsserver', 'sumneko_lua', 'omnisharp' }
				-- Ensure the servers above are installed
				require('mason-lspconfig').setup {}

				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

				for _, lsp in ipairs(servers) do
					require('lspconfig')[lsp].setup { on_attach = on_attach, capabilities = capabilities }
				end

				local runtime_path = vim.split(package.path, ';')
				table.insert(runtime_path, 'lua/?.lua')
				table.insert(runtime_path, 'lua/?/init.lua')

				require('lspconfig').sumneko_lua.setup {
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						Lua = {
							runtime     = { version = 'LuaJIT', path = runtime_path, },
							diagnostics = { globals = { 'vim' } },
							workspace   = { library = vim.api.nvim_get_runtime_file('', true) },
							telemetry   = { enable = false },
						},
					},
				}
			end
		},
			'williamboman/mason-lspconfig.nvim',
		},
		after = "nvim-cmp",
	}

	use { -- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			event = "InsertEnter"
		},
		config = function()
			-- nvim-cmp setup
			local cmp = require 'cmp'

			cmp.setup {
				mapping = cmp.mapping.preset.insert {
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { 'i', 's' })
				},
				sources = {
					{ name = 'nvim_lsp' },
				},
			}
		end,
		after = "cmp-nvim-lsp"
	}

	use {{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup {
				highlight = { enable = true },
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
				},
			}

		end,
		event = "InsertEnter"
	},{
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}}

	use {
		'sam4llis/nvim-tundra',
		config = function()
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
			local lbls = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }

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
			local lbls = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }

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
		config = function()
			local cfg = {
				explorer = { cmd = "nnn", width = 24 },
				picker = {
					cmd = "nnn",
					style = { width = 1, height = 1, xoffset = 0, yoffset = 0 }
				},
				auto_close = true
			}
			require("nnn").setup(cfg)
		end,
		cmd = { "NnnExplorer", "NnnPicker" }
	}
end)

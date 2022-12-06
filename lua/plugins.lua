require('packer').startup(function(use)
	use {
		'wbthomason/packer.nvim',
		'nvim-lua/plenary.nvim'
	}

	use {
		'neovim/nvim-lspconfig',
		requires = {
			{
				'williamboman/mason.nvim',
				config = function()
					-- LSP settings.
					--  This function gets run when an LSP connects to a particular buffer.
					local on_attach = function(_, bufnr)
						-- NOTE: Remember that lua is a real programming language, and as such it is possible
						-- to define small helper and utility functions so you don't have to repeat yourself
						-- many times.
						--
						-- In this case, we create a function that lets us more easily define mappings specific
						-- for LSP related items. It sets the mode, buffer and description for us each time.
						-- Create a command `:Format` local to the LSP buffer
						vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
							if vim.lsp.buf.format then
								vim.lsp.buf.format()
							elseif vim.lsp.buf.formatting then
								vim.lsp.buf.formatting()
							end
						end, { desc = 'Format current buffer with LSP' })
					end

					-- Setup mason so it can manage external tooling
					require('mason').setup()

					-- Enable the following language servers
					-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
					local servers = { 'rust_analyzer', 'tsserver', 'sumneko_lua', 'omnisharp' }

					-- Ensure the servers above are installed
					require('mason-lspconfig').setup {
						ensure_installed = servers,
					}

					-- nvim-cmp supports additional completion capabilities
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

					for _, lsp in ipairs(servers) do
						require('lspconfig')[lsp].setup {
							on_attach = on_attach,
							capabilities = capabilities,
						}
					end

					-- Example custom configuration for lua
					--
					-- Make runtime files discoverable to the server
					local runtime_path = vim.split(package.path, ';')
					table.insert(runtime_path, 'lua/?.lua')
					table.insert(runtime_path, 'lua/?/init.lua')

					require('lspconfig').sumneko_lua.setup {
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									-- Tell the language server which version of Lua you're using (most likely LuaJIT)
									version = 'LuaJIT',
									-- Setup your lua path
									path = runtime_path,
								},
								diagnostics = {
									globals = { 'vim' },
								},
								workspace = { library = vim.api.nvim_get_runtime_file('', true) },
								-- Do not send telemetry data containing a randomized but unique identifier
								telemetry = { enable = false },
							},
						},
					}
				end
			},
			'williamboman/mason-lspconfig.nvim',
		},
	}

	use { -- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp'
		},
		config = function()
			-- nvim-cmp setup
			local cmp = require 'cmp'

			cmp.setup {
				mapping = cmp.mapping.preset.insert {
					['<C-Up>'] = cmp.mapping.scroll_docs(-4),
					['<C-Down>'] = cmp.mapping.scroll_docs(4),
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
						end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
						else
							fallback()
						end
						end, { 'i', 's' }),
				},
				sources = {
					{ name = 'nvim_lsp' },
				},
			}
		end
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
		config = function()
			local cfg = {
				explorer = {
					cmd = "nnn",       -- command overrride (-F1 flag is implied, -a flag is invalid!)
					width = 24,        -- width of the vertical split
					side = "topleft",  -- or "botright", location of the explorer window
				},
				picker = {
					cmd = "nnn",       -- command override (-p flag is implied)
					style = {
						width = 1,     -- percentage relative to terminal size when < 1, absolute otherwise
						height = 1,    -- ^
						xoffset = 0,   -- ^
						yoffset = 0,   -- ^
						border = "rounded"-- border decoration for example "rounded"(:h nvim_open_win)
					}
				},
				auto_close = true,
				mappings = {},       -- table containing mappings, see below
				windownav = {        -- window movement mappings to navigate out of nnn
					left = "<C-w>h",
					right = "<C-w>l",
					next = "<C-w>w",
					prev = "<C-w>W",
				},
			}
			require("nnn").setup(cfg)
		end,
		cmd = { "NnnExplorer", "NnnPicker" }
	}
end)

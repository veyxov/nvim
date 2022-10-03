local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    -- lsp
    use { {
        'williamboman/mason-lspconfig.nvim', -- Load on LspStart command (1.1)
        cmd = "LspStart"
    }, {
        "williamboman/mason.nvim",
        after = "mason-lspconfig.nvim" -- Load after mason-lspconfig (1.2)
    }, {
        'neovim/nvim-lspconfig', -- Load after mason.nvim (1.3)
        config = kfg 'lsp',
        after = "mason.nvim"
    }, {
        'glepnir/lspsaga.nvim', -- Load on LspSaga command (2)
        config = kfg 'lspsaga',
        cmd    = "Lspsaga"
    } }

    -- Snippets
    use {
        'L3MON4D3/LuaSnip',
        config = kfg 'luasnip',
        event = "InsertEnter"
    }

    use {
        -- Completion and sources
        { 'hrsh7th/nvim-cmp', config = kfg 'cmp', after = "nvim-lspconfig" }, -- Run after 1.3 (3.1)
        { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" }, -- Run all the providers after
        { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" },
        { 'hrsh7th/cmp-buffer', after = "nvim-cmp" },
        { 'hrsh7th/cmp-path', after = "nvim-cmp" },
        { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" },
    }

    -- Tree-sitter
    -- use 'nvim-treesitter/playground'
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
        run = ":TSUpdate",
        event = "InsertEnter"
    }

    -- Treesitter-textobjects
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = kfg 'treesitter-textobjects',
        after = "nvim-treesitter"
    }

    -- Gruvbox
    use {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                inverse = true,
                invert_selection = false,
                contrast = "hard",
            })
        end,
        event = "InsertEnter"
    }

    use {
        'folke/tokyonight.nvim',

        config = function()
            require("tokyonight").setup({
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                sidebars = { "qf", "help", "packer", "neotree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                hide_inactive_statusline = true,
                dim_inactive = true, -- dims inactive windows
            })
        end,
        event = "InsertEnter"
    }

    use {
        'bluz71/vim-moonfly-colors',
        config = function()
            vim.cmd('colorscheme moonfly');
        end,
        event = "InsertEnter"
    }

    use {
        "catppuccin/nvim", as = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

            require("catppuccin").setup({
                compile = {
                    enabled = true,
                    path = vim.fn.stdpath("cache") .. "/catppuccin",
                },
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.15,
                },
            })
        end,
        event = "InsertEnter"
    }


    use {
        'ggandor/leap.nvim',
        config = function()
            require('leap').set_default_keymaps()
            require('leap').setup {
                safe_labels = { 'n', 'e', 'i', 'o', 'a', 'r', 's', 't', 'd', 'h', 'w', 'y', 'f', 'u' },
                labels = { 'n', 'e', 'i', 'o', 'a', 'r', 's', 't', 'd', 'h', 'w', 'y', 'f', 'u' },

                special_keys = {
                    repeat_search  = '<enter>',
                    next_aot_match = '<enter>',
                    next_match     = { ';', '<enter>' },
                    prev_match     = { ',', '<tab>' },
                    next_group     = '<space>',
                    prev_group     = '<tab>',
                },
            }
        end,
        keys = { 's', 'S' }
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = false,
            }
        end,
        after = "nvim-treesitter"
    }

    -- Hydra
    use { {
        'anuvyklack/keymap-layer.nvim',
    }, {
        'anuvyklack/hydra.nvim',
        config = kfg 'hydra'
    } }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = kfg 'telescope',
        cmd = "Telescope"
    }

    -- File tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        config = kfg 'tree',
        branch = "v2.x",
        requires = {
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree"
    }

    use {
        'vimpostor/vim-tpipeline'
    }

    -- Html
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
        ft = { "html", "xml", "jsx", "js", "javascriptreact" }
    }

    use {
        'ThePrimeagen/harpoon'
    }

    -- Surround
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert_line = "<C-g>S",
                    normal = "ks",
                    normal_cur = "kss",
                    normal_line = "kS",
                    normal_cur_line = "ySS",
                    visual = "K",
                    visual_line = "gS",
                    delete = "ds",
                    change = "kc",
                },
            })
        end,
        event = "InsertEnter"
    }

    use({
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup {
                modes = { -- configurations per mode
                    ataraxis = {
                        backdrop = 0.5, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
                        callbacks = {
                            open_pre = function() vim.fn.jobstart("tmux set status off") end,
                            close_pre = function() vim.fn.jobstart("tmux set status on") end,
                        }
                    },
                    minimalist = {
                        ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
                        options = { -- options to be disabled when entering Minimalist mode
                            signcolumn = "yes",
                            laststatus = 0,
                        },
                        callbacks = {
                            open_pre = function() vim.fn.jobstart("tmux set status off") end,
                            close_pre = function() vim.fn.jobstart("tmux set status on") end,
                        }
                    },
                }
            }
        end,
        cmd = "TZAtaraxis"
    })
end,
    config = { git = { clone_timeout = nil } }
})

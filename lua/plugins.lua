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
        'ZhiyuanLck/smart-pairs',
        event = 'InsertEnter',
        config = function()
            require('pairs'):setup()
        end
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

    use { 'nagy135/typebreak.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            vim.keymap.set('n', '<leader>tb', require('typebreak').start, { desc = "Typebreak" })
        end
    }

    use {
        'bluz71/vim-moonfly-colors',
        event = "InsertEnter"
    }

    use {
        "arnamak/stay-centered.nvim",
        config = function()
            require("stay-centered")
        end
    }
    use {
        "sainnhe/everforest",
        config = function()
            vim.g.everforest_background = 'hard'
            vim.cmd('color everforest')
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                toggler = {
                    line = 'gcc',
                    block = 'gbc',
                },
                opleader = {
                    line = 'gc',
                    block = 'gb',
                },
                extra = {
                    above = 'gcO',
                    below = 'gco',
                    eol = 'gA',
                },
                mappings = {
                    basic = true,
                    extra = true,
                    extended = false,
                },
                pre_hook = nil,
                post_hook = nil,
            }
        end
    }

    use {
        'ggandor/leap.nvim',
        config = function()
            local leap = require 'leap'
            leap.add_default_mappings()
            leap.opts.safe_labels = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }
            leap.opts.labels = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }
        end
    }

    use {
        'ggandor/leap-spooky.nvim',
        config = function()
            require('leap-spooky').setup {
                affixes = {
                    -- These will generate mappings for all native text objects, like:
                    -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
                    -- Special line objects will also be added, by repeating the affixes.
                    -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
                    -- window.
                    -- You can also use 'rest' & 'move' as mnemonics.
                    remote   = { window = 'r', cross_window = 'R' },
                    magnetic = { window = 'm', cross_window = 'M' },
                },
                -- If this option is set to true, the yanked text will automatically be pasted
                -- at the cursor position if the unnamed register is in use.
                paste_on_remote_yank = false,
            }
        end
    }

    use {
        'ggandor/flit.nvim',
        config = function()
            require('flit').setup {
                keys = { f = 'f', F = 'F', t = 't', T = 'T' },
                -- A string like "nv", "nvo", "o", etc.
                labeled_modes = "v",
                multiline = true,
                -- Like `leap`s similar argument (call-specific overrides).
                -- E.g.: opts = { equivalence_classes = {} }
                opts = {}
            }
        end
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
        'ThePrimeagen/harpoon'
    }

    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            vim.diagnostic.config({
                virtual_text = false,
            })
            require("lsp_lines").setup()
        end,
        after = "nvim-lspconfig"
    }

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

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
end,
    config = { git = { clone_timeout = nil } }
})

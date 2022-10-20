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

    use 'junegunn/vim-easy-align'
    use { 'nagy135/typebreak.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            vim.keymap.set('n', '<leader>tb', require('typebreak').start, { desc = "Typebreak" })
        end
}
    use {
        'smithbm2316/centerpad.nvim',
        config = function()
            -- or using the lua function
            vim.api.nvim_set_keymap('n', '<leader>z',
                "<cmd>lua require'centerpad'.toggle{ leftpad = 45, rightpad = 0 }<cr>",
                { silent = true, noremap = true })
        end
    }

    use {
        'bluz71/vim-moonfly-colors',
        config = function()
            vim.cmd('colorscheme moonfly');
        end,
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
            require('leap').set_default_keymaps()
            require('leap').setup {
                safe_labels = { 'n', 'e', 'i', 'o', 'a', 'r', 's', 't' },
                labels = { 'n', 'e', 'i', 'o', 'a', 'r', 's', 't' },

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

    use {
        'ja-ford/delaytrain.nvim',
        config = function()
            require('delaytrain').setup {
                delay_ms = 2000, -- How long repeated usage of a key should be prevented
                grace_period = 1, -- How many repeated keypresses are allowed
                keys = { -- Which keys (in which modes) should be delayed
                    ['nv'] = { 'h', 'j', 'k', 'l' },
                    ['nvi'] = { '<Left>', '<Down>', '<Up>', '<Right>' },
                },
            }
        end
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
end,
    config = { git = { clone_timeout = nil } }
})

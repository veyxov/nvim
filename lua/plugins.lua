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
        'bluz71/vim-moonfly-colors',
        config = function()
            vim.cmd('colorscheme moonfly');
        end,
        event = "InsertEnter"
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = 'gcc',
                    ---Block-comment toggle keymap
                    block = 'gbc',
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = 'gc',
                    ---Block-comment keymap
                    block = 'gb',
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = 'gcO',
                    ---Add comment on the line below
                    below = 'gco',
                    ---Add comment at the end of line
                    eol = 'gA',
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true,
                    ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
                    extended = false,
                },
                ---Function to call before (un)comment
                pre_hook = nil,
                ---Function to call after (un)comment
                post_hook = nil,
            }
        end
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
        'ja-ford/delaytrain.nvim',
        config = function()
            require('delaytrain').setup {
                delay_ms = 1000, -- How long repeated usage of a key should be prevented
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

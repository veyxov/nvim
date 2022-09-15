local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    -- Hlargs
    use {
        'm-demare/hlargs.nvim',
        config = function ()
            require('hlargs').setup()
        end
    }

    -- Foldings
    use {
        'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async',
        config = function()
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            vim.keymap.set('n', 'zO', require('ufo').openAllFolds)
            vim.keymap.set('n', 'Z', require('ufo').closeAllFolds)
            require('ufo').setup({
                provider_selector = function()
                    return {'treesitter', 'indent'}
                end
            })
        end
    }

    -- Treesitter-context
    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require 'treesitter-context'.setup {}
        end
    }

    -- Matchparen
    use {
        'monkoose/matchparen.nvim',
        config = function ()
            require('matchparen').setup({
                hl_group = 'WarningMsg', -- highlight group for matched characters
            })
        end
    }

    -- Harpoon
    use 'ThePrimeagen/harpoon'
    use 'Hoffs/omnisharp-extended-lsp.nvim'

    -- Snippets
    use {
        'L3MON4D3/LuaSnip',
        config = kfg 'luasnip'
    }
    -- lsp
    use {{
        'neovim/nvim-lspconfig',
        config = kfg 'lsp',
    },{
        "williamboman/mason.nvim"
    },{
        'williamboman/mason-lspconfig.nvim'
    },{
        'glepnir/lspsaga.nvim',
        config = kfg 'lspsaga',
    }}

    -- Auto completion and code analiz
    use {
        -- Completion and sources
        { 'hrsh7th/nvim-cmp', config = kfg 'cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'andersevenrud/cmp-tmux' },
    }

    -- Tree-sitter
    use 'nvim-treesitter/playground'
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
        run = ":TSUpdate"
    }

    -- Treesitter-textobjects
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = kfg 'treesitter-textobjects',
    }

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
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
        end
    }

    -- Tokyonight
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "night"
            vim.g.tokyonight_italic_comments = true
        end
    }

    -- Lightspeed
    use {
        'ggandor/lightspeed.nvim',
        keys = { 's', 'S', 'f', 'F' },
        config = kfg 'speed'
    }

    -- Hydra
    use {{
        'anuvyklack/keymap-layer.nvim',
    },{
        'anuvyklack/hydra.nvim',
        config = kfg 'hydra'
    }}

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = kfg 'telescope',
    }


    -- File tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        config = kfg 'tree',
        branch = "v2.x",
        requires = {
            "MunifTanjim/nui.nvim",
            {
                's1n7ax/nvim-window-picker',
                tag = "v1.*",
                config = function()
                    require'window-picker'.setup {
                        selection_chars = 'arstneiodhgmywufpl',
                    }
                end,
            }
        },
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
                    change = "cs",
                },
            })
        end
    }
end,
    config = { git = { clone_timeout = nil } }
})

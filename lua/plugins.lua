local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    use {
        'danth/pathfinder.vim'
    }

    use {
        "mizlan/iswap.nvim",
        config = function ()
            require('iswap').setup{
                keys = 'aorisetndhywufmgq',

                -- Grey out the rest of the text when making a selection
                -- (enabled by default)
                grey = 'disable',

                -- Highlight group for the sniping value (asdf etc.)
                -- default 'Search'
                hl_snipe = 'ErrorMsg',

                -- Highlight group for the visual selection of terms
                -- default 'Visual'
                hl_selection = 'WarningMsg',

                -- Highlight group for the greyed background
                -- default 'Comment'
                hl_grey = 'LineNr',

                -- Post-operation flashing highlight style,
                -- either 'simultaneous' or 'sequential', or false to disable
                -- default 'sequential'
                flash_style = false,

                -- Highlight group for flashing highlight afterward
                -- default 'IncSearch'
                hl_flash = 'ModeMsg',

                -- Move cursor to the other element in ISwap*With commands
                -- default false
                move_cursor = true,

                -- Automatically swap with only two arguments
                -- default nil
                autoswap = true,

                -- Other default options you probably should not change:
                debug = nil,
                hl_grey_priority = '1000',
            }
        end
    }

    use {
        'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async',
        config = function()
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return {'treesitter', 'indent'}
                end
            })
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require 'treesitter-context'.setup {}
        end
    }

    use {
        'monkoose/matchparen.nvim',
        config = function ()
            require('matchparen').setup({
                hl_group = 'WarningMsg', -- highlight group for matched characters
            })
        end
    }

    use 'ThePrimeagen/harpoon'
    use 'Hoffs/omnisharp-extended-lsp.nvim'

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

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = kfg 'treesitter-textobjects',
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

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
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "night"
            vim.g.tokyonight_italic_comments = true
        end
    }

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

    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function() require("nvim-surround").setup({ }) end
    }
end,
    config = { git = { clone_timeout = nil } }
})

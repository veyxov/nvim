local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'lewis6991/impatient.nvim', 'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',    'kyazdani42/nvim-web-devicons'
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = kfg 'todo'
    }

    use 'ThePrimeagen/harpoon'

    use {
        'declancm/cinnamon.nvim',
        config = kfg 'cinnamon'
    }

    use {
        'folke/twilight.nvim',
        config = function() require("twilight").setup { } end
    }

    use {
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup {
                integrations = {
                    tmux = true,
                    twilight = true
                }
            }
        end
    }

    use {
        "Tsuzat/NeoSolarized.nvim",
        config = kfg 'solarized'
    }

    use 'B4mbus/oxocarbon-lua.nvim'

    -- Lua
    use {
        "folke/trouble.nvim",
        config = kfg 'trouble'
    }

    use {
        'L3MON4D3/LuaSnip',
        config = kfg 'luasnip'
    }
    -- LTestsp
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
    },{
        'ray-x/lsp_signature.nvim',
        config = kfg 'signature',
    }}

    -- Auto completion and code analiz
    use {
        -- Candy
        { 'onsails/lspkind.nvim' },

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
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = kfg 'treesitter-textobjects',
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Debugger
    use
    {{
        'mfussenegger/nvim-dap',
        config = kfg 'dap',
    },{
        "rcarriga/nvim-dap-ui",
        config = kfg 'dapui',
    }}

    use 'Yazeed1s/minimal.nvim'

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

    use 'nvim-treesitter/playground'

    -- File tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        config = kfg 'tree',
        requires = "MunifTanjim/nui.nvim"
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
            vim.diagnostic.config({
                virtual_text = false,
            })
        end,
    })

    use {
        'lewis6991/;gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'navarasu/onedark.nvim',
        config = function ()
            -- Lua
            require('onedark').setup  {
                -- Main options --
                style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                transparent = false,  -- Show/hide background
                term_colors = true, -- Change terminal color as per the selected theme style
                ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
                cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

                -- toggle theme style ---
                toggle_style_key = "<leader>cc", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
                toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

                -- Change code style ---
                -- Options are italic, bold, underline, none
                -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
                code_style = {
                    comments = 'italic',
                    keywords = 'bold',
                    functions = 'none',
                    strings = 'italic',
                    variables = 'none'
                },

                -- Plugins Config --
                diagnostics = {
                    darker = true, -- darker colors for diagnostic
                    undercurl = true,   -- use undercurl instead of underline for diagnostics
                    background = true,    -- use background color for virtual text
                },
            }
        end
    }


    -- Golang
    use { 'ray-x/go.nvim', config = function() require('go').setup() end }
    use 'ray-x/guihua.lua'
end,
config = {
    git = { clone_timeout = nil }
}
})

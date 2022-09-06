local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function ()
            require('lualine').setup() {
                options = { section_separators = '', component_separators = '' }
            }
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require'treesitter-context'.setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                -- For all filetypes
                -- Note that setting an entry here replaces all other patterns for this entry.
                -- By setting the 'default' entry below, you can control which nodes you want to
                -- appear in the context window.
                default = {
                    'class',
                    'function',
                    'method',
                    'for',
                    'while',
                    'if',
                    'switch',
                    'case',
                },
                -- Patterns for specific filetypes
                -- If a pattern is missing, *open a PR* so everyone can benefit.
                tex = {
                    'chapter',
                    'section',
                    'subsection',
                    'subsubsection',
                },
                rust = {
                    'impl_item',
                    'struct',
                    'enum',
                },
                scala = {
                    'object_definition',
                },
                vhdl = {
                    'process_statement',
                    'architecture_body',
                    'entity_declaration',
                },
                markdown = {
                    'section',
                },
                elixir = {
                    'anonymous_function',
                    'arguments',
                    'block',
                    'do_block',
                    'list',
                    'map',
                    'tuple',
                    'quoted_content',
                },
                json = {
                    'pair',
                },
                yaml = {
                    'block_mapping_pair',
                },
            },
            zindex = 20, -- The Z-index of the context window
            mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
        }
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
    }
    }

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

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
end,
    config = { git = { clone_timeout = nil } }
})

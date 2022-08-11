local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'lewis6991/impatient.nvim', 'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',    'kyazdani42/nvim-web-devicons'
    }

    use {
        'declancm/cinnamon.nvim',
        config = function() require('cinnamon').setup {
                default_keymaps = true,   -- Create default keymaps.
                extra_keymaps = true,    -- Create extra keymaps.
                extended_keymaps = true, -- Create extended keymaps.
                override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

                -- OPTIONS:
                always_scroll = false,    -- Scroll the cursor even when the window hasn't scrolled.
                centered = true,          -- Keep cursor centered in window when using window scrolling.
                default_delay = 3,        -- The default delay (in ms) between each line when scrolling.
                hide_cursor = true,      -- Hide the cursor while scrolling. Requires enabling termguicolors!
                horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
                max_length = 500,          -- Maximum length (in ms) of a command. The line delay will be
                -- re-calculated. Setting to -1 will disable this option.
                scroll_limit = -1,       -- Max number of lines moved before scrolling is skipped. Setting
                -- to -1 will disable this option.
            }
        end
    }

    use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }

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
        config = function ()
            vim.g.NeoSolarized_italics = 1 -- 0 or 1
            vim.g.NeoSolarized_lineNr = 0 -- 0 or 1 (default) -> To Show backgroung in LineNr

            vim.cmd [[
                try
                    colorscheme NeoSolarized
                catch /^Vim\%((\a\+)\)\=:E18/
                    colorscheme default
                    set background=dark
                endtry
                highlight FloatBorder guibg=NONE ctermbg=NONE  " Removes the border of float menu (LSP and Autocompletion uses it)
                highlight link NormalFloat Normal 
                highlight NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE 
                highlight Pmenu ctermbg=NONE guibg=NONE 
            ]]
        end
    }

    use 'B4mbus/oxocarbon-lua.nvim'

    -- Lua
    use {
        "folke/trouble.nvim",
        config = kfg 'trouble'
    }

    use {
        "zbirenbaum/copilot.lua",
        event = {"VimEnter"},
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
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
        {
            "zbirenbaum/copilot-cmp",
            module = "copilot_cmp",
        }
    }

    -- Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
    }

    use {
        'nvim-treesitter/playground',
        config = function()
            require "nvim-treesitter.configs".setup {
                playground = {
                    enable = true,
                    keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus_language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?',
                    },
                }
            }
        end
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
            vim.cmd[[colorscheme tokyonight]]
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

    -- Rest
    use {
        "NTBBloodbath/rest.nvim",
        config = kfg 'rest'
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
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = false,
                indent_blankline_show_first_indent_level = false
            }
        end
    }

    -- Sql
    use {
        'nanotee/sqls.nvim',
    }

    use {
        'kdheepak/lazygit.nvim',
        cmd = "LazyGit"
    }
end,
    config = {
        git = { clone_timeout = nil }
    }
})

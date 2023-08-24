local Moonlify = {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    event = 'VeryLazy',
    config = function() vim.cmd.colorscheme 'moonfly' end,
}

local Gruvbox = {
    'ellisonleao/gruvbox.nvim',
    event = 'VeryLazy',
    config = function()
        vim.cmd.colorscheme 'gruvbox'
        vim.cmd [[hi Normal guibg=#000000]] -- colors like ThePrimeagen
    end,
}

local Poimandres = {
    'olivercederborg/poimandres.nvim',
    event = 'VeryLazy',
    config = function()
        require('poimandres').setup {
            bold_vert_split = true,
            dim_nc_background = true,
            disable_background = true,
        }

        vim.cmd.colorscheme 'poimandres'
    end,
}

local Kanagawa = {
    'rebelot/kanagawa.nvim',
    event = 'VeryLazy',
    config = function()
        require('kanagawa').setup {
            compile = true, -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            dimInactive = true, -- dim inactive window `:h hl-NormalNC`
            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = 'none' },
                    FloatBorder = { bg = 'none' },
                    FloatTitle = { bg = 'none' },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = {
                        fg = theme.ui.bg_p1,
                        bg = theme.ui.bg_p1,
                    },
                    TelescopeResultsNormal = {
                        fg = theme.ui.fg_dim,
                        bg = theme.ui.bg_m1,
                    },
                    TelescopeResultsBorder = {
                        fg = theme.ui.bg_m1,
                        bg = theme.ui.bg_m1,
                    },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = {
                        bg = theme.ui.bg_dim,
                        fg = theme.ui.bg_dim,
                    },
                }
            end,
            theme = 'wave',
            background = {
                dark = 'wave', -- try "dragon" !
                light = 'lotus',
            },
        }

        -- setup must be called before loading
        vim.cmd 'colorscheme kanagawa'
    end,
}

local Sonokay = {
    'sainnhe/sonokai',
    event = 'VeryLazy',
    init = function()
        vim.g.sonokai_style = 'atlantis'

        vim.g.sonokai_enable_italic = 1
        vim.g.sonokai_transparent_background = 0
        vim.g.sonokai_dim_inactive_windows = 1
        vim.g.sonokai_diagnostic_text_highlight = 1
    end,
    config = function() vim.cmd.colorscheme 'sonokai' end,
}

local Rose = {
    'rose-pine/neovim',
    as = 'rose-pine',
    event = 'VeryLazy',
    config = function()
        require('rose-pine').setup {
            --- @usage 'auto'|'main'|'moon'|'dawn'
            variant = 'moon',
            --- @usage 'main'|'moon'|'dawn'
            dark_variant = 'main',
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = false,
            disable_float_background = false,
            disable_italics = false,

            --- @usage string hex value or named color from rosepinetheme.com/palette
            groups = {
                background = 'base',
                background_nc = '_experimental_nc',
                panel = 'surface',
                panel_nc = 'base',
                border = 'highlight_med',
                comment = 'muted',
                link = 'iris',
                punctuation = 'subtle',

                error = 'love',
                hint = 'iris',
                info = 'foam',
                warn = 'gold',

                headings = {
                    h1 = 'iris',
                    h2 = 'foam',
                    h3 = 'rose',
                    h4 = 'gold',
                    h5 = 'pine',
                    h6 = 'foam',
                },
                -- or set all headings at once
                -- headings = 'subtle'
            },

            -- Change specific vim highlight groups
            -- https://github.com/rose-pine/neovim/wiki/Recipes
            highlight_groups = {
                ColorColumn = { bg = 'rose' },

                -- Blend colours against the "base" background
                CursorLine = { bg = 'foam', blend = 10 },
                StatusLine = { fg = 'love', bg = 'love', blend = 10 },
            },
        }

        -- Set colorscheme after options
        vim.cmd 'colorscheme rose-pine'
    end,
}

local Fluro = {
    'maxmx03/fluoromachine.nvim',
    event = 'VeryLazy',
    config = function()
        local fm = require 'fluoromachine'

        fm.setup {
            glow = true,
            --theme = 'delta'
        }

        vim.cmd.colorscheme 'fluoromachine'
    end,
}

local OneNord = {
    'rmehri01/onenord.nvim',
    event = 'VeryLazy',
    config = function() require('onenord').setup() end,
}

local Tokyio = {
    'folke/tokyonight.nvim',
    event = 'VeryLazy',
    priority = 1000,
    opts = {},
    config = function() vim.cmd [[colorscheme tokyonight]] end,
}

local Catpuchin = {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- TODO: What is this?
    event = 'VeryLazy',
    config = function()
        require('catppuccin').setup {
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                harpoon = true,
                noice = true,
                telescope = {
                    enabled = true,
                    style = 'nvchad',
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { 'italic' },
                        hints = { 'italic' },
                        warnings = { 'italic' },
                        information = { 'italic' },
                    },
                    underlines = {
                        errors = { 'underline' },
                        hints = { 'underline' },
                        warnings = { 'underline' },
                        information = { 'underline' },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            },
        }
        vim.cmd [[colorscheme catppuccin]]
    end,
}

local Citruszest = {
    'zootedb0t/citruszest.nvim',
    lazy = false,
    priority = 1000,
    config = function() vim.cmd [[colorscheme citruszest]] end,
}

local Nordic = {
    'AlexvZyl/nordic.nvim',
    event = 'InsertEnter',
    priority = 1000,
    config = function() require('nordic').load() end,
}

return {
    Gruvbox,
}

local Moonlify = {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    event = 'VeryLazy',
    config = function()
        vim.cmd.colorscheme 'moonfly'
    end
}

local Gruvbox = {
    "ellisonleao/gruvbox.nvim",
    event = 'VeryLazy',
    config = function()
        vim.cmd.colorscheme 'gruvbox'
    end,
}

local Poimandres = {
    'olivercederborg/poimandres.nvim',
    event = 'VeryLazy',
    config = function()
        require('poimandres').setup {
            bold_vert_split = true,
            dim_nc_background = true,
            disable_background = true
        }

        vim.cmd.colorscheme 'poimandres'
    end
}

local Kanagawa = {
    "rebelot/kanagawa.nvim",
    event = 'VeryLazy',
    config = function()
        require('kanagawa').setup({
            compile = true,     -- enable compiling the colorscheme
            undercurl = true,   -- enable undercurls
            dimInactive = true, -- dim inactive window `:h hl-NormalNC`
            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                }
            end,
            theme = "wave",
            background = {
                dark = "wave", -- try "dragon" !
                light = "lotus"
            },
        })

        -- setup must be called before loading
        vim.cmd("colorscheme kanagawa")
    end
}

local Sonokay = {
    "sainnhe/sonokai",
    event = 'VeryLazy',
    init = function()
        vim.g.sonokai_style = 'maia'

        vim.g.sonokai_enable_italic = 1
        vim.g.sonokai_transparent_background = 0
        vim.g.sonokai_dim_inactive_windows = 1
        vim.g.sonokai_diagnostic_text_highlight = 1
    end,
    config = function()
        vim.cmd.colorscheme 'sonokai'
    end
}

return Sonokay;

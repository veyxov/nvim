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
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                }
            end,
            theme = "wave", -- Load "wave" theme when 'background' option is not set
            background = {
                -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus"
            },
        })

        -- setup must be called before loading
        vim.cmd("colorscheme kanagawa") 
    end
}

return Kanagawa;

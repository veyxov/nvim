require("lazy").setup("plugz", {
    defaults = { lazy = true },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true },
    ui = { size = { width = 1, height = 1 } },
    performance = {
        rtp = {
            disabled_plugins = { "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin", },
        },
    },
    debug = false,
})

require("lazy").setup("plugz", {
    defaults = { lazy = true },
    install = { missing = true },
    ui = { size = { width = 1, height = 1 } },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin",
                "tohtml", "tutor", "zipPlugin", "spellfile", "rplugin"
            },
        },
    },
})

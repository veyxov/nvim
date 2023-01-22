require("lazy").setup("plugz", {
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
    },
    install = {
        missing = true,
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 1, height = 1 },
        throttle = 1,
    },
    checker = {
        enabled = true,
        notify = false, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false, -- get a notification when changes are found
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin",
            },
        },
    },
})

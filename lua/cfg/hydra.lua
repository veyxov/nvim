local Cmd = require 'globals'.Cmd
local Hydra = require("hydra")

Hydra({
    name = "Change / Resize Window",
    mode = 'n',
    body = "<C-w>",
    config = {
        hint = false -- Don't show hints
    },
    heads = {
        -- equalize window sizes
        { "e", "<C-w>=" },
        { "s", Cmd "new" },
        { "v", Cmd "vnew" },

        -- Moving around
        { '<up>', '<C-W>k' },
        { '<down>', '<C-W>j' },
        { '<left>', '<C-W>h' },
        { '<right>', '<C-W>l' },

        -- Resizing
        { '<m-up>', '<C-w>2+' },
        { '<m-down>', '<C-w>2-' },
        { '<m-left>', '<C-w>3<' },
        { '<m-right>', '<C-w>3>' },

        { 'f', Cmd 'Telescope find_files' },

        -- close active window
        { "q", ":q<cr>" },

        -- exit this Hydra
        { "<Esc>", nil, { exit = true, nowait = true } },
    },
})

Hydra({
    name = 'Side scroll',
    mode = 'n',
    body = 'z',
    heads = {
        { '<left>', '5zh' },
        { '<right>', '5zl', { desc = '←/→' } },
        { '<up>', 'zH' },
        { '<down>', 'zL', { desc = 'half screen ←/→' } },
    }
})

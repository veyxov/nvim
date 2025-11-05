local neogit = {
    "NeogitOrg/neogit",
    keys = {
        {
            "<leader>ga",
            function()
                require("neogit").action("commit", "commit")()
            end,
            desc = "Git commit",
        },
        {
            "<leader>gc",
            function()
                require("neogit").action("push", "to_upstream")()
            end,
            desc = "Git push",
        },
        {
            "<leader>gg",
            "<cmd>Neogit<cr>",
            desc = "Git status",
        },
    },
    cmd = { "Neogit" },
    opts = {
        disable_hint = true,
        graph_style = "kitty",
        integrations = {
            diffview = true,
            telescope = true
        },

        commit_editor = {
            ["qu"]         = "Submit",
            ["<c-c><c-k>"] = "Abort",
        },
        commit_editor_I = {
            ["<c-c><c-c>"] = "Submit",
            ["<c-c><c-k>"] = "Abort",
        }
    }
}

return neogit;

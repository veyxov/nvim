return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = {
            matcher = {
                frecency = true,
                cwd_bonus = true,
            },
        },
        scroll = { enabled =  true },
        words = { enabled = false },
        statuscolumn = { enabled = false },
    },
    keys = {
        { "?s", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "?g", function() Snacks.picker.grep() end, desc = "Grep" },
        { "?f", function() Snacks.explorer() end, desc = "File Explorer" },
        { "?r", function() Snacks.picker.recent() end, desc = "Recent" },
        { "?d", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "?i", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
        { "?t", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "?T", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

        { "?z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        { "?Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
        { "?.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "?S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "?n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "?bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
        { "?cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "?gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
        { "?gg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "?un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
        { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    }
}

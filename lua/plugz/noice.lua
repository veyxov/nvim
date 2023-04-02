local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<S-Enter>",
            function() require("noice").redirect(vim.fn.getcmdline()) end,
            mode = "c",
            desc =
            "Redirect Cmdline"
        },
        {
            "<leader>snl",
            function() require("noice").cmd("last") end,
            desc =
            "Noice Last Message"
        },
        {
            "<leader>snh",
            function() require("noice").cmd("history") end,
            desc =
            "Noice History"
        },
        {
            "<leader>sna",
            function() require("noice").cmd("all") end,
            desc =
            "Noice All"
        },
        {
            "<c-f>",
            function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
            silent = true,
            expr = true,
            desc =
            "Scroll forward",
            mode = {
                "i", "n", "s" }
        },
        {
            "<c-b>",
            function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
            silent = true,
            expr = true,
            desc =
            "Scroll backward",
            mode = {
                "i", "n", "s" }
        },
    },
}

M.config = function()
    local opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
        background_color = '#FF0000',
        health = {
            checker = false, -- Disable if you don't want health checks to run
        },
        views = {
            cmdline_popup = {
                relative = "editor",
                border = {
                    style = "none",
                    padding = { 1, 1 },
                },
                filter_options = {},
                win_options = {
                    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 6,
                    col = "50%",
                },
                border = {
                    style = "none",
                    padding = { 0, 1 },
                },
            },
        },
    }

    require 'noice'.setup(opts)
end
return M

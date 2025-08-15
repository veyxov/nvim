local gitsigns = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
        { 'ja', '<cmd>Gitsigns stage_hunk<cr>', mode = 'n' },
        { 'jA', '<cmd>Gitsigns stage_buffer<cr>', mode = 'n' },
        { 'jr', '<cmd>Gitsigns undo_stage_hunk<cr>', mode = 'n' },

        { 'ju', '<cmd>Gitsigns reset_hunk<cr>', mode = 'n' },
        { 'jU', '<cmd>Gitsigns reset_buffer<cr>', mode = 'n' },

        { 'jn', '<cmd>Gitsigns next_hunk<cr>', mode = 'n' },
        { 'jp', '<cmd>Gitsigns preview_hunk<cr>', mode = 'n' },

        { 'jb', '<cmd>Gitsigns blame_line<cr>', mode = 'n' },

        {
            'ju',
            function()
                require('gitsigns').reset_hunk {
                    vim.fn.line '.',
                    vim.fn.line 'v',
                }
            end,
            mode = 'v',
        },
        {
            'ja',
            function()
                require('gitsigns').stage_hunk {
                    vim.fn.line '.',
                    vim.fn.line 'v',
                }
            end,
            mode = 'v',
        },
    },
    config = function() require('gitsigns').setup {} end,
}

local diff = {
    'sindrets/diffview.nvim',
    cmd = 'Diffview',
    keys = {

    },
    config = function()

    end
}

local neogit = {
    "NeogitOrg/neogit",
    keys = {
        {
            "<leader>gc",
            function()
                require("neogit").action("commit", "commit")()
            end,
            desc = "Git commit",
        },
        {
            "<leader>gp",
            function()
                require("neogit").action("push", "to_upstream")()
            end,
            desc = "Git commit",
        },
        {
            "<leader>gs",
            "<cmd>Neogit<cr>",
            desc = "Git commit",
        },
    },
    cmd = { "Neogit" },
    opts = {
        graph_style = "kitty",
    },
}

return {
    gitsigns,
    diff,
    neogit
}

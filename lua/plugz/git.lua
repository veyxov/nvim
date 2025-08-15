local gitsigns = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
        { 'ju', '<cmd>Gitsigns reset_hunk<cr>' },
        { 'jU', '<cmd>Gitsigns reset_buffer<cr>' },

        { 'jn', '<cmd>Gitsigns next_hunk<cr>' },
        { 'jp', '<cmd>Gitsigns prev_hunk<cr>' },

        { 'jb', '<cmd>Gitsigns blame_line<cr>' },

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
    lazy = false
}

return {
    gitsigns,
    diff,
    neogit
}

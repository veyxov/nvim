local nx = { 'n', 'x' }

-- TODO: Check out the new last-put text object
return {
    'gbprod/yanky.nvim',
    keys = {
        {
            'hl',
            '<cmd>YankyRingHistory<cr>',
            mode = nx,
        },
        {
            'h',
            '<Plug>(YankyYank)',
            mode = nx,
        },
        {
            'hh',
            'yy',
            mode = nx,
        },
        {
            '<leader>h',
            '"+y',
            mode = nx,
        },
        {
            '<leader>hh',
            '"+yy',
            mode = nx,
        },
        {
            'p',
            '<Plug>(YankyPutAfter)',
            mode = nx,
        },
        {
            'P',
            '<Plug>(YankyPutBefore)',
            mode = nx,
        },
        {
            'hn',
            '<Plug>(YankyCycleForward)',
            mode = nx,
        },
        {
            'hp',
            '<Plug>(YankyCycleBackward)',
            mode = nx,
        },
    },
    opts = {},
}

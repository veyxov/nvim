local M = {
    'kylechui/nvim-surround',
    keys = {
        { 'l', '<Plug>(nvim-surround-normal)' },
        {
            'L',
            '<Plug>(nvim-surround-normal-line)',
        },
        {
            'll',
            '<Plug>(nvim-surround-normal-cur)',
        },
        {
            'LL',
            '<Plug>(nvim-surround-normal-cur-line)',
        },
        {
            'l',
            "<Esc><Cmd>lua require'nvim-surround'.visual_surround({ line_mode = false })<CR>",
            mode = { 'x' }
        },
        {
            'ds',
            '<Plug>(nvim-surround-delete)',
        },
        {
            'cs',
            '<Plug>(nvim-surround-change)',
        },
    },
    opts = {},
}

return M

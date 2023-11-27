local function m(rhs, x)
    return {
        rhs,
        string.format('<Plug>(nvim-surround-%s)', x),
    }
end

local M = {
    'kylechui/nvim-surround',
    keys = {
        m('l', 'normal'),
        m('L', 'normal-line'),
        m('ll', 'normal-cur'),
        m('LL', 'normal-cur-line'),
        m('ds', 'delete'),
        m('cs', 'change'),
        {
            'l',
            "<Esc><Cmd>lua require'nvim-surround'.visual_surround({ line_mode = false })<CR>",
            mode = 'x',
        },
    },
    opts = {},
}

return M

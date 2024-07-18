local function m(rhs, x, mode)
    mode = mode or "n"
    return {
        rhs,
        string.format('<Plug>(nvim-surround-%s)', x),
        mode = mode
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
        m('l', 'visual', {'v'})
    },
    opts = {},
}

return M

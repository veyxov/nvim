local nx = { 'n', 'x' }
local function m(r, x)
    return {
        r,
        '<Plug>(Yanky' .. x .. ')',
        mode = nx,
    }
end
local function _m(l, r) return { r, l, mode = nx } end
-- TODO: Check out the new last-put text object
return {
    'gbprod/yanky.nvim',
    keys = {
        m('hl', 'RingHistory'),
        m('h', 'Yank'),
        m('p', 'PutAfter'),
        m('P', 'PutBefore'),
        m('hn', 'CycleForward'),
        m('hp', 'CycleBackward'),
        _m('H', 'y$'),
        _m('hh', 'yy'),
        _m('<leader>h', '"+y'),
        _m('leader>hh', '"+yy'),
    },
    opts = {},
}

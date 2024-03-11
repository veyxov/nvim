local nx = { 'n', 'x' }

local function _m(key, lhs) return { key, lhs, mode = nx } end
local function m(key, cmd) return _m(key, '<Plug>(Yanky' .. cmd .. ')') end

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
        _m('H', 'y$'),
        _m('hh', 'yy'),
        _m('<leader>h', '"+y'),
        _m('<leader>hh', '"+yy'),
    },
    opts = {},
}

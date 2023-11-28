local nx = { 'n', 'x' }
local function m(r, x)
    return {
        r,
        '<Plug>(Yanky' .. x .. ')',
        mode = nx
    }
end
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
    },
    opts = {},
}

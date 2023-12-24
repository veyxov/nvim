local M = {
    'chrisgrieser/nvim-various-textobjs',
    opts = {},
}

local key = function(rhs, x, y)
    local ox = { 'o', 'x' }
    return {
        rhs,
        string.format("<cmd>lua require('various-textobjs').%s(%s)<CR>", x, y),
        mode = ox,
    }
end

M.keys = {
    key('ag', 'entireBuffer', ''),

    key('ii', 'indentation', 'true, true'),
    key('ai', 'indentation', 'false, false'),

    key('ih', 'subword', 'true'),
    key('ah', 'subword', 'false'),

    key('ab', 'anyBracket', "'outer'"),
    key('ib', 'anyBracket', "'inner'"),

    key('ar', 'value', 'false'),
    key('ir', 'value', 'true'),

    key('ak', 'key', 'false'),
    key('ik', 'key', 'true'),

    key('im', 'chainMember', 'true'),
    key('am', 'chainMember', 'false'),
}

return M

local ox = { 'o', 'x' }
local M = {
    'chrisgrieser/nvim-various-textobjs',
    config = function()
        require('various-textobjs').setup {
            -- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
            -- set to 0 to only look in the current line
            lookForwardSmall = 25,

            -- lines to seek forwards for "big" textobjs (linewise textobjs & url textobj)
            lookForwardBig = 15,
        }
    end,
}

M.keys = {
    {
        'ii',
        "<cmd>lua require('various-textobjs').indentation(true, true)<CR>",
        mode = ox,
    },
    {
        'aI',
        "<cmd>lua require('various-textobjs').indentation(false, true)<CR>",
        mode = ox,
    },
    {
        'ai',
        "<cmd>lua require('various-textobjs').indentation(false, false)<CR>",
        mode = ox,
    },
    {
        'iI',
        "<cmd>lua require('various-textobjs').indentation(true, true)<CR>",
        mode = ox,
    },
    {
        'ah',
        "<cmd>lua require('various-textobjs').subword(true)<CR>",
        mode = ox,
    },
    {
        'ih',
        "<cmd>lua require('various-textobjs').subword(false)<CR>",
        mode = ox,
    },
    {
        [[t']],
        "<cmd>lua require('various-textobjs').toNextQuotationMark()<CR>",
        mode = ox,
    },
    {
        'ax',
        "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>",
        mode = ox,
    },
    {
        'ar',
        "<cmd>lua require('various-textobjs').value(false)<CR>",
        mode = ox,
    },
    {
        'ir',
        "<cmd>lua require('various-textobjs').value(true)<CR>",
        mode = ox,
    },
    {

        'ak',
        "<cmd>lua require('various-textobjs').key(false)<CR>",
        mode = ox,
    },
    {

        'ik',
        "<cmd>lua require('various-textobjs').key(true)<CR>",
        mode = ox,
    },
    {

        'im',
        "<cmd>lua require('various-textobjs').chainMember(true)<CR>",
        mode = ox,
    },
    {
        'am',
        "<cmd>lua require('various-textobjs').chainMember(false)<CR>",
        mode = ox,
    },
    {
        'gw',
        "<cmd>lua require('various-textobjs').visibleInWindow()<CR>",
        mode = ox,
    },
}

return M

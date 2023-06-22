return {
    'chrisgrieser/nvim-various-textobjs',
    lazy = false,
    config = function()
        local map = require('globals').Map

        require('various-textobjs').setup {
            -- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
            -- set to 0 to only look in the current line
            lookForwardSmall = 25,

            -- lines to seek forwards for "big" textobjs (linewise textobjs & url textobj)
            lookForwardBig = 15,
        }

        local keymap = vim.keymap.set

        -- indentation based objects
        keymap(
            { 'o', 'x' },
            'ii',
            "<cmd>lua require('various-textobjs').indentation(true, true)<CR>"
        )
        keymap(
            { 'o', 'x' },
            'ai',
            "<cmd>lua require('various-textobjs').indentation(false, true)<CR>"
        )
        keymap(
            { 'o', 'x' },
            'iI',
            "<cmd>lua require('various-textobjs').indentation(true, true)<CR>"
        )
        keymap(
            { 'o', 'x' },
            'aI',
            "<cmd>lua require('various-textobjs').indentation(false, false)<CR>"
        )

        -- subword
        keymap(
            { 'o', 'x' },
            'ah',
            "<cmd>lua require('various-textobjs').subword(true)<CR>"
        )
        keymap(
            { 'o', 'x' },
            'ih',
            "<cmd>lua require('various-textobjs').subword(false)<CR>"
        )

        -- to next closing bracket
        keymap(
            { 'o', 'x' },
            't;',
            "<cmd>lua require('various-textobjs').toNextClosingBracket()<CR>"
        )
        keymap(
            { 'o', 'x' },
            'ax',
            "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>"
        )

        -- rhs
        keymap(
            { 'o', 'x' },
            'ar',
            "<cmd>lua require('various-textobjs').value(false)<CR>"
        )
        keymap(
            { 'o', 'x' },
            'ir',
            "<cmd>lua require('various-textobjs').value(true)<CR>"
        )
        -- lhs
        keymap(
            { 'o', 'x' },
            'ak',
            "<cmd>lua require('various-textobjs').key(false)<CR>"
        )
        keymap(
            { 'o', 'x' },
            'ik',
            "<cmd>lua require('various-textobjs').key(true)<CR>"
        )
        -- Member funcions
        keymap(
            { 'o', 'x' },
            'im',
            "<cmd>lua require('various-textobjs').chainMember(true)<CR>"
        )
        keymap(
            { 'o', 'x' },
            'am',
            "<cmd>lua require('various-textobjs').chainMember(false)<CR>"
        )
        -- Visible part of the screen
        map(
            'gw',
            "<cmd>lua require('various-textobjs').visibleInWindow()<CR>",
            { 'o', 'x' }
        )
    end,
}

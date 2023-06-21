return {
    'chrisgrieser/nvim-various-textobjs',
    lazy = false,
    config = function()
        local map = require('globals').Map

        -- default config
        require('various-textobjs').setup {
            -- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
            -- set to 0 to only look in the current line
            lookForwardSmall = 5,

            -- lines to seek forwards for "big" textobjs (linewise textobjs & url textobj)
            lookForwardBig = 15,

            -- use suggested keymaps (see README)
            useDefaultKeymaps = false,

            -- disable some default keymaps, e.g. { "ai", "ii" }
            disabledKeymaps = {},
        }

        local keymap = vim.keymap.set
        -- rhs
        keymap(
            { 'o', 'x' },
            'ar',
            '<cmd>lua require(\'various-textobjs\').value(true)<CR>'
        )
        keymap(
            { 'o', 'x' },
            'ir',
            '<cmd>lua require(\'various-textobjs\').value(false)<CR>'
        )
        -- lhs
        keymap(
            { 'o', 'x' },
            'ak',
            '<cmd>lua require(\'various-textobjs\').key(true)<CR>'
        )
        keymap(
            { 'o', 'x' },
            'ik',
            '<cmd>lua require(\'various-textobjs\').key(false)<CR>'
        )
        -- Member funcions
        keymap(
            { 'o', 'x' },
            'im',
            '<cmd>lua require(\'various-textobjs\').chainMember(true)<CR>'
        )
        keymap(
            { 'o', 'x' },
            'am',
            '<cmd>lua require(\'various-textobjs\').chainMember(false)<CR>'
        )
        -- Visible part of the screen
        map(
            'gw',
            '<cmd>lua require(\'various-textobjs\').visibleInWindow()<CR>',
            { 'o', 'x' }
        )
    end,
}

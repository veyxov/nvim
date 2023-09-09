return {
    'lewis6991/gitsigns.nvim',
    keys = { 'j' },
    event = 'VeryLazy',
    config = function()
        local gs = require 'gitsigns'
        local map = require('globals').Map

        gs.setup {}

        -- Add/reset
        map('jj', gs.stage_hunk)
        map('js', gs.preview_hunk)
        map('ju', gs.reset_hunk)
        map('jJ', gs.stage_buffer)
        map('jU', gs.reset_buffer)

        -- Toggles
        map('jtw', gs.toggle_word_diff)
        map('jtt', gs.toggle_signs)

        -- Blaming
        map('jb', gs.blame_line)

        -- Diffing
        map('jD', gs.diffthis)

        map('gh', gs.next_hunk)

        map(
            'ju',
            function() gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
            'v'
        )

        -- Visual mode mappings
        map(
            'jj',
            function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
            'v'
        )

        map('jb', function() gs.blame_line { full = true } end, { 'v' })
    end,
}

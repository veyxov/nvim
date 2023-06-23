return {
    'lewis6991/gitsigns.nvim',
    keys = { 'j' },
    config = function()
        local gs = require 'gitsigns'
        local map = require('general').Map

        gs.setup { yadm = { enable = true } }

        -- Add/reset
        map('jj', gs.stage_hunk)
        map('ju', gs.reset_hunk)
        map('jJ', gs.stage_buffer)
        map('jU', gs.reset_buffer)

        map('js', gs.preview_hunk)

        -- Toggles
        map('jtw', gs.toggle_word_diff)
        map('jtt', gs.toggle_signs)

        -- Blaming
        map('jb', gs.blame_line)

        -- Diffing
        map('jD', gs.diffthis)

        map('gh', gs.next_hunk)

        map('ih', ':<C-U>Gitsigns select_hunk<CR>', { 'o', 'x' })

        map('jj', function()
            gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'v')
        map('ju', function()
            gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'v')

        map('hb', function()
            gs.blame_line { full = true }
        end)
    end,
}
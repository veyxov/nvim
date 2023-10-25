local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'InsertEnter',
}

M.dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
}

local opts = {
    ensure_installed = {
        'lua',
        'vim',
        'vimdoc',
        'markdown',
        'markdown_inline',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'kk', -- TODO: play around with this more
            scope_incremental = ',m',
            node_incremental = 'kk',
            node_decremental = 'kx',
        },
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['au'] = '@parameter.inner', -- TODO: Train with this
                ['aa'] = '@parameter.outer',
            },
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ['kf'] = '@function.outer',
                ['ka'] = '@parameter.inner',
                ['kl'] = '@loop.outer',
                ['kc'] = '@class.outer',
            },
            goto_next_end = {
                ['kF'] = '@function.outer',
                ['kC'] = '@class.outer',
            },

            -- NOTE: No need for these becase repeating with ; and ,
            goto_previous_start = {},
            goto_previous_end = {},
        },
        -- TODO: play around with this
        swap = {},
    },
}

function M.config()
    require('nvim-treesitter.configs').setup(opts)
    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
    vim.keymap.set(
        { 'n', 'x', 'o' },
        ',',
        ts_repeat_move.repeat_last_move_previous
    )
end

return M

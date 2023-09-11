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
        'json',
        'vimdoc',
        'regex',
        'markdown',
        'markdown_inline',
    },
    -- highlight
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
    },
    autotag = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = ',,', -- TODO: play around with this more
            scope_incremental = ',,',
            node_incremental = ',m',
            node_decremental = ',n',
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
                ['a/'] = '@comment.outer',
                ['i/'] = '@comment.inner',
                ['au'] = '@parameter.inner',
                ['aa'] = '@parameter.outer',
            },
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ['['] = '@function.outer',
                ['gc'] = '@class.outer',
            },
            goto_next_end = {
                ['('] = '@function.outer',
                ['Gc'] = '@class.outer',
            },
            goto_previous_start = {
                [']'] = '@function.outer',
                ['gC'] = '@class.outer',
            },
            goto_previous_end = {
                ['GC'] = '@class.outer',
                [')'] = '@function.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
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

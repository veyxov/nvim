local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'InsertEnter',
}

M.dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    {
        'nvim-treesitter/nvim-treesitter-context',
        keys = {
            { "<leader>xc", "<cmd>TSContextToggle<cr>" },
            { 'gx',         function() require 'treesitter-context'.go_to_context() end }
        },
        config = function()
            require 'treesitter-context'.setup {
                enable = true,
                max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 9999,   -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    }
}

local opts = {
    ensure_installed = {
        'lua', 'vim', 'json', 'vimdoc',
        'c_sharp', 'regex', 'bash', 'markdown', 'markdown_inline'
    },
    -- highlight
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' }
    },
    autotag = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['aif'] = '@conditional.outer',
                ['iif'] = '@conditional.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['AA'] = '@parameter.inner',
                ['aa'] = '@parameter.outer',
                ['a=='] = '@assignment.outer',
                ['i=='] = '@assignment.inner',
                ['i=r'] = '@assignment.lhs',
                ['i=d'] = '@assignment.rhs',
            },
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ['['] = '@function.outer',
                ['gc'] = '@class.outer'
            },
            goto_next_end = {
                ['('] = '@function.outer',
                ['Gc'] = '@class.outer',
            },
            goto_previous_start = {
                [']'] = '@function.outer',
                ['gC'] = '@class.outer'
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
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
}

function M.config()
    require 'nvim-treesitter.configs'.setup(opts)
    local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
end

return M

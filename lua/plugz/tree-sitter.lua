local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'InsertEnter',
}

M.dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
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
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']'] = '@function.outer',
                ['gb'] = '@block.inner'
            },
            goto_next_end = {
                ['gF'] = '@function.outer',
            },
            goto_previous_start = {
                ['['] = '@function.outer',
            },
            goto_previous_end = {
                --['GM'] = '@function.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>gm'] = '@function.outer',
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
}

function M.config()
    require 'nvim-treesitter.configs'.setup(opts)
end

return M

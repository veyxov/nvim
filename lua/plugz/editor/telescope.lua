local M = {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
}

function M.config()
    local telescope = require 'telescope'

    telescope.setup {
        defaults = {
            borderchars = {
                '─',
                '│',
                '─',
                '│',
                '┌',
                '┐',
                '┘',
                '└',
            },
            mappings = {
                i = {
                    -- ['<esc>'] = actions.close,
                    ['<C-H>'] = false,
                    ['<C-U>'] = false,
                },
            },
            layout_strategy = 'horizontal',
            layout_config = {
                prompt_position = 'bottom',
            },
            sorting_strategy = 'ascending',
            prompt_prefix = ' ',
            selection_caret = ' ',
            winblend = 0,
        },
    }

    telescope.load_extension 'fzf'
end

local function live_grep_from_project_git_root()
    local function is_git_repo()
        vim.fn.system 'git rev-parse --is-inside-work-tree'

        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir('.git', '.;')
        return vim.fn.fnamemodify(dot_git_path, ':h')
    end

    local opts = {}

    if is_git_repo() then opts = {
        cwd = get_git_root(),
    } end

    require('telescope.builtin').live_grep(opts)
end

M.keys = {
    {
        '<leader>?',
        function() require('telescope.builtin').oldfiles() end,
    },
    {
        '<leader>sb',
        function() require('telescope.builtin').buffers() end,
    },
    {
        '<leader>n',
        function() require('telescope.builtin').find_files() end,
    },
    { '<leader>gc', '<cmd>Telescope grep_string theme=ivy<cr>' },
    {
        '<leader>G',
        function() live_grep_from_project_git_root() end,
    },
    {
        '<leader>gg',
        function() require('telescope.builtin').live_grep() end,
    },
    {
        '<leader>/',
        '<cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown previewer=false<cr>',
    },
    { 'jh', '<cmd>Telescope git_branches<cr>' },
}

return M

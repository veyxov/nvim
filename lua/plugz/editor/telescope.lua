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
    local actions = require 'telescope.actions'

    telescope.setup {
        extensions = {
            advanced_git_search = {
                diff_plugin = 'diffview',
                show_builtin_git_pickers = false,
            },
            undo = {
                use_delta = true,
                -- Big side by side view
                side_by_side = true,
                layout_strategy = 'vertical',
                layout_config = {
                    preview_height = 0.8,
                },
            },
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },
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
                    ['<esc>'] = actions.close,
                    -- ['<C-H>'] = TODO: clean current line
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

local function project_files()
    local opts = {} -- define here if you want to define something
    vim.fn.system 'git rev-parse --is-inside-work-tree'
    if vim.v.shell_error == 0 then
        require('telescope.builtin').git_files(opts)
    else
        require('telescope.builtin').find_files(opts)
    end
end

M.keys = {
    { '<leader>n', function() project_files() end },
    { '<leader>gc', '<cmd>Telescope grep_string theme=ivy<cr>' },
    {
        '<leader>g',
        function() live_grep_from_project_git_root() end,
    },
    {
        '<leader>/',
        '<cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown previewer=false<cr>',
    },
    { 'jh', '<cmd>Telescope git_branches<cr>' },
}

return M

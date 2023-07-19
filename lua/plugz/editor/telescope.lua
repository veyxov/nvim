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

local project_files = function()
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
    { '<leader>g', '<cmd>Telescope live_grep theme=ivy<cr>' },
    {
        '<leader>/',
        '<cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown previewer=false<cr>',
    },
    { 'jh', '<cmd>Telescope git_branches<cr>' },
}

return M

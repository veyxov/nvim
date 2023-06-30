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
            layout_strategy = 'horizontal',
            layout_config = {
                prompt_position = 'bottom',
            },
            sorting_strategy = 'ascending',
            prompt_prefix = ' ',
            selection_caret = ' ',
            winblend = 0,
        },
    }

    telescope.load_extension 'fzf'
end

M.keys = {
    { '<leader>n', '<cmd>Telescope find_files<cr>' },
    { '<leader>g', '<cmd>Telescope grep_string theme=ivy<cr>' },
    {
        '<leader>/',
        '<cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown previewer=false<cr>',
    },
    { '<cr>o', '<cmd>Telescope lsp_workspace_symbols<cr>' },
    { 'jh', '<cmd>Telescope git_branches<cr>' },
}

return M

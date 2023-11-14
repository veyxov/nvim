local M = {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        {
            'nvim-telescope/telescope-ui-select.nvim',
        }
    },
}

function M.config()
    local telescope = require 'telescope'

    telescope.setup {
        defaults = {
            sorting_strategy = 'ascending',
        },
    }

    telescope.load_extension 'fzf'
    telescope.load_extension 'ui-select'
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
        '<leader>gg',
        function() require('telescope.builtin').live_grep() end,
    },
    {
        '<leader>/',
        '<cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown previewer=false<cr>',
    },
}

return M

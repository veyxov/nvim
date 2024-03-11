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
        },
    },
}

M.config = function()
    local telescope = require 'telescope'
    telescope.load_extension 'fzf'
    telescope.load_extension 'ui-select'
    telescope.setup {
        defaults = {
            sorting_strategy = 'ascending',
        },
        extensions = {
            ['ui-select'] = {
                require('telescope.themes').get_dropdown {},
            },
        },
    }
end

local function m(l, x)
    return {
        l,
        string.format('<cmd>Telescope %s<cr>', x),
    }
end

M.keys = {
    m('?', 'find_files'),
    m('<leader>?', 'oldfiles'),

    m('<leader>sb', 'buffers'),
    m('<leader>d', 'diagnostics'),

    m('<leader>gc', 'grep_string theme=ivy'),
    m('<leader>gg', 'live_grep'),
    m(
        '<leader>/',
        'current_buffer_fuzzy_find theme=get_dropdown previewer=false<cr>'
    ),
}

return M

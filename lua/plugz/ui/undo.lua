return {
    'tzachar/highlight-undo.nvim',
    keys = {
        { 'u' },
        { '<C-r>' },
    },
    config = function()
        require('highlight-undo').setup {
            hlgroup = 'DiffAdd',
            duration = 300,
            keymaps = {
                { 'n', 'u', 'undo', {} },
                { 'n', '<C-r>', 'redo', {} },
            },
        }
    end,
}

local M = {
    'stevearc/oil.nvim',
    keys = {
        {
            '-',
            function() require('oil').open() end,
        },
    },
}

-- TODO: Revisit and read the docs for this plugin
M.config = function()
    require('oil').setup {
        columns = {
            'icon',
            'size',
        },
        win_options = {
            conceallevel = 3,
            concealcursor = 'in',
        },
        skip_confirm_for_simple_edits = true,
        keymaps = {
            ['t'] = 'actions.select',
            ['<C-i>'] = 'actions.select_vsplit',
            ['<C-e>'] = 'actions.select_split',
            ['<C-t>'] = 'actions.select_tab',
            ['<C-p>'] = 'actions.preview',
            ['n'] = 'actions.parent',
            ['qu'] = 'actions.close',
            ['<C-h>'] = 'actions.close',
            ['<C-l>'] = 'actions.refresh',
            --["h"] = "actions.open_cwd",
            ['cd'] = 'actions.cd',
            ['~'] = 'actions.tcd',
            ['.'] = 'actions.toggle_hidden',
            ['yy'] = 'actions.copy_entry_path',
        },
        float = {
            padding = 3,
            border = 'single',
            win_options = {
                winblend = 5,
            },
        },
    }
end

return M

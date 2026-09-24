vim.pack.add({ { src = gh 'sindrets/diffview.nvim' } })

later(function()
    local actions = require 'diffview.actions'
    require('diffview').setup({
        keymaps = {
            file_panel = {
                { 'n', 'e', actions.select_next_entry },
                { 'n', 'i', actions.select_prev_entry },
            },
        },
    })
end)

map('gd', function()
    local is_open = require('diffview.lib').get_current_view()
    vim.cmd(is_open and 'DiffviewClose' or 'DiffviewOpen')
end)

lmap('gL', cmd 'DiffviewFileHistory %')

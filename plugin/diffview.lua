pack('sindrets/diffview.nvim', { load = false })

local loaded = false
local function load_diffview()
    if loaded then return end
    vim.cmd.packadd 'diffview.nvim'
    local actions = require 'diffview.actions'
    require 'diffview'.setup {
        keymaps = {
            file_panel = {
                { 'n', 'e', actions.select_next_entry },
                { 'n', 'i', actions.select_prev_entry },
            },
        },
    }
    loaded = true
end

autocmd('CmdUndefined', 'diffview', {
    pattern = 'Diffview*',
    callback = load_diffview,
})

map('gd', function()
    load_diffview()
    local is_open = require 'diffview.lib'.get_current_view()
    vim.cmd(is_open and 'DiffviewClose' or 'DiffviewOpen')
end)

lmap('gL', function()
    load_diffview()
    vim.cmd 'DiffviewFileHistory %'
end)

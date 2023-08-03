local map = require('globals').Map

map('<leader>s', '<cmd>wall<cr>') -- Save file

-- Quitting made easy
map('qu', '<cmd>wq<cr>')
map('<leader>q', '<cmd>qall!<cr>')
map('<C-H>', '<C-W>', 'i')
map('<C-H>', '<cmd>q<cr>')

--- Replace text-object with yanked content
-- TODO: Any better alternatives?
-- NOTE: There is a plugin for this
map(';r', function()
    local paste_cmd = 'p'
    local prev_func = vim.go.operatorfunc

    _G.paste_replace = function()
        vim.api.nvim_feedkeys('`[v`]' .. paste_cmd, 'n', true)
        vim.go.operatorfunc = prev_func
        _G.paste_replace = nil
    end
    vim.go.operatorfunc = 'v:lua.paste_replace'
    vim.api.nvim_feedkeys('g@', 'n', false)
end)

-- Window navigation
map('<C-Down>', '<C-w><Down>')
map('<C-Left>', '<C-w><Left>')
map('<C-Right>', '<C-w><Right>')
map('<C-Up>', '<C-w><Up>')

-- Add undo break-points
map(',', ',<c-g>u', 'i')
map('.', '.<c-g>u', 'i')
map(';', ';<c-g>u', 'i')

map('<leader>v', '<C-V>') -- Visual block mode

-- Insert a semicolon at the end of the line and create a new one
map('<F5>', '<esc>A;<esc>o', 'i')

map('H', 'y$')

-- better indenting
map('<', '<gv', 'v')
map('>', '>gv', 'v')

-- Wierd bug, when toggling symbol layer, continues to delete
map('d<Space>', '<nop>')

-- fix spelling errors
map('fl', '1z=') -- Fix Word Under Cursor
map('<Esc>', ':nohl<CR>:echo<CR>') -- Clear

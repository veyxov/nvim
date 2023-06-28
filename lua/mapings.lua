local map = require('globals').Map

local nvo = { 'n', 'v', 'o' }

--- Replace text-object with yanked content
-- TODO: Any better alternatives?
map(';r', function()
    local paste_cmd = 'p'
    local prev_func = vim.go.operatorfunc
    -- selene: allow(global_usage)
    _G.paste_replace = function()
        vim.api.nvim_feedkeys('`[v`]' .. paste_cmd, 'n', true)
        vim.go.operatorfunc = prev_func
        _G.paste_replace = nil
    end
    vim.go.operatorfunc = 'v:lua.paste_replace'
    vim.api.nvim_feedkeys('g@', 'n', false)
end)

-- Quitting made easy
map('<leader>qu', '<cmd>qall!<cr>')
map('qu', '<cmd>wq<cr>')
map('<bs>', '<cmd>q<cr>')

-- Window navigation
map('<C-Down>', '<C-w><Down>')
map('<C-Left>', '<C-w><Left>')
map('<C-Right>', '<C-w><Right>')
map('<C-Up>', '<C-w><Up>')

-- Add undo break-points
map(',', ',<c-g>u', 'i')
map('.', '.<c-g>u', 'i')
map(';', ';<c-g>u', 'i')

map('<leader>s', '<cmd>wall<cr>') -- Save file

-- Select and copy
map('h', 'y', nvo)
map('H', 'y$')

map('y', '<cmd>quit<cr>', nvo)
map('<leader>h', '"+y', nvo)
map('<leader>H', '"+y$', nvo)
map('<leader>hh', '"+yy', nvo)

map('y', '<cmd>quit<cr>', nvo)
map('<leader>h', '"+y', nvo)
map('<leader>H', '"+y$', nvo)
map('<leader>hh', '"+yy', nvo)
-- Copy end

map('<leader>v', '<C-V>') -- Visual block mode

-- Insert a semicolon at the end of the line and create a new one
map('<F5>', '<esc>A;<esc>o', 'i')

-- better indenting
map('<', '<gv', 'v')
map('>', '>gv', 'v')

map('<leader>l', '<cmd>Lazy<cr>', 'n')

-- text objects
map('ij', 'i"', { 'o', 'x' })

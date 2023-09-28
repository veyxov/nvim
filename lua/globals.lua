local M = {}

M.Map = function(l, r, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, l, r)
end

return M

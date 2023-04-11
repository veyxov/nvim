local M = {
    -- Mapping helper
    Map = function(lhs, rhs, mode)
        mode = mode or 'n' -- default to normal mode
        vim.keymap.set(mode, lhs, rhs)
    end
}

return M

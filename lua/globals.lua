local M = {}
-- Mapping helper
M.Map = function(lhs, rhs, mode)
    mode = mode or 'n' -- normal, most of the time
    vim.keymap.set(mode, lhs, rhs)
end

-- Languages that need LSP and CMP
M.smart_langs = {
    'go',
    'javascript',
    'lua',
    'rust',
    'typescript',
    'vim',
}

return M

local M = {
    'kylechui/nvim-surround',
    keys = { "ys", "cs", "ds", "S" }
}

M.config = function(arst)
    -- We aliased b->(, r->[
    -- But ab ar motions does not exist in vim
    vim.keymap.set("o", "ir", "i[")
    vim.keymap.set("o", "ar", "a[")
    vim.keymap.set("o", "ia", "i<")
    vim.keymap.set("o", "aa", "a<")

    require 'nvim-surround'.setup {
    }
end

return M

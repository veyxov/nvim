local M = {
    'kylechui/nvim-surround',
    keys = { "ys", "cs", "ds" }
}

M.config = function()
    -- We aliased b->(, r->[
    -- But ab ar motions does not exist in vim
    vim.keymap.set("o", "ir", "i[")
    vim.keymap.set("o", "ar", "a[")
    vim.keymap.set("o", "ia", "i<")
    vim.keymap.set("o", "aa", "a<")

    require 'nvim-surround'.setup {
        move_cursor = false
    }
end

return M

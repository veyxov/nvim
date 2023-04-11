local M = {
    'kylechui/nvim-surround',
    keys = { "ys", "cs", "ds", { "S", mode = "v" } }
}

M.config = function()
    -- We aliased b->(, r->[
    -- But ab ar motions does not exist in vim
    local map = require 'globals'.Map

    map('ir', 'i[', 'o')
    map('ar', 'a[', 'o')
    map('ia', 'i<', 'o')
    map('aa', 'a<', 'o')

    require 'nvim-surround'.setup {
        move_cursor = false
    }
end

return M

local M = {
    'kylechui/nvim-surround',
    keys = { { 'l', mode = 'n' }, 'll', 'cs', 'ds', { 'l', mode = 'v' } },
}

M.config = function()
    -- We aliased b->(, r->[
    -- But ab ar motions does not exist in vim
    local map = require('globals').Map

    map('ir', 'i[', 'o')
    map('ar', 'a[', 'o')
    map('ia', 'i<', 'o')
    map('aa', 'a<', 'o')

    require('nvim-surround').setup {
        move_cursor = false,
        keymaps = {
            normal = 'l',
            normal_cur = 'll',
            normal_line = 'L',
            normal_cur_line = 'Ll',
            visual = 'l',
            visual_line = 'L',
            delete = 'ds',
            change = 'cs',
            change_line = 'cl',
        },
    }
end

return M

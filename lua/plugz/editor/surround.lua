local M = {
    'kylechui/nvim-surround',
    keys = { { 'l', mode = 'n' }, 'll', 'cs', 'ds', { 'l', mode = 'v' } },
}

M.config = function()
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

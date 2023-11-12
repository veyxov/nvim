local M = {
    'kylechui/nvim-surround',
    keys = { 'L', { 'l', mode = 'n' }, 'll', 'cs', 'ds', { 'l', mode = 'v' } },
}

M.config = function()
    require('nvim-surround').setup {
        move_cursor = false,
        keymaps = {
            normal = 'l',
            normal_cur = 'll',
            normal_line = 'L',
            normal_cur_line = 'LL',
            visual = 'l',
            visual_line = 'L',
            delete = 'ds',
            change = 'cs',
        },
    }
end

return M

local M = {
    'ThePrimeagen/harpoon',
    keys = {
        {
            '<C-a>',
            function()
                require('harpoon.mark').add_file()
            end,
        },
        {
            '<C-h>',
            function()
                require('harpoon.ui').toggle_quick_menu()
            end,
        },
        '1',
        '2',
        '3',
        '4',
    },
}

M.config = function()
    require('harpoon').setup {}
    local map = require('globals').Map

    for i = 1, 4, 1 do
        local i_str = tostring(i)
        map(i_str, '<cmd>lua require"harpoon.ui".nav_file(' .. i_str .. ')<cr>')
    end
end

return M

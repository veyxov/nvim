local M = {
    'ThePrimeagen/harpoon',
    keys = {
        {
            '<C-a>',
            function() require('harpoon.mark').add_file() end,
        },
        {
            '<leader><C-H>',
            function() require('harpoon.ui').toggle_quick_menu() end,
        },
        '<leader>da',
        '<leader>de',
        '<leader>di',
        '<leader>dh',
    },
}

M.config = function()
    require('harpoon').setup {
        menu = {
            width = vim.api.nvim_win_get_width(0) - 4,
        },
    }

    local map = require('globals').Map

    local chars = { '<leader>da', '<leader>de', '<leader>di', '<leader>dh' }
    local i = 1
    for _, char in ipairs(chars) do
        map(char, '<cmd>lua require"harpoon.ui".nav_file(' .. i .. ')<cr>')
        i = i + 1
    end
end

return M

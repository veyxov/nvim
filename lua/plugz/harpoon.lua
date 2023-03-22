local M = {
    'ThePrimeagen/harpoon',
    keys = { "ht", "ha", "1", "2", "3", "4" }
}

M.config = function()
    require 'harpoon'.setup {}

    require 'telescope'.load_extension('harpoon')

    vim.keymap.set('n', 'ha', function() require("harpoon.mark").add_file() end)
    vim.keymap.set('n', 'ht', '<cmd>Telescope harpoon marks<cr>')

    for i = 1, 4, 1 do
        local i_str = tostring(i);
        vim.keymap.set('n', i_str,
            '<cmd>lua require"harpoon.ui".nav_file(' .. i_str .. ')<cr>')
    end
end

return M

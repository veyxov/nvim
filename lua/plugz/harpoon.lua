local M = {
    'ThePrimeagen/harpoon',
    lazy = false
}

M.init = function()
    vim.keymap.set('n', 'ha', function() require("harpoon.mark").add_file() end)
    vim.keymap.set('n', 'ht', '<cmd>Telescope harpoon marks<cr>')
end

M.config = function()
    require 'harpoon'.setup {}

    require 'telescope'.load_extension('harpoon')
end

return M

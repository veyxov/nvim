local M = {
    'AlexvZyl/nordic.nvim',
    enabled = true,
    lazy = false
}

M.config = function()
    require 'nordic'.setup { }

    vim.cmd.colorscheme "nordic"
end

return M

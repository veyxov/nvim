local M = {
    'ThePrimeagen/harpoon',
    lazy = false
}

M.init = function()

end

M.config = function()
    require 'harpoon'.setup {}

    require 'telescope'.load_extension('harpoon')
end

return M

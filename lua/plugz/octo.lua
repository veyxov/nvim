local M = {
    'pwntester/octo.nvim',
    cmd = 'Octo'
}

M.config = function()
    require "octo".setup()
end
return M

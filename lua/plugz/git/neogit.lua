local M = {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = false
}

M.config = function()
    local neogit = require('neogit')

    neogit.setup {}
end

return M

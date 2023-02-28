local M = {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly',
    lazy = false
}

M.config = function()
    require("nvim-tree").setup({

    })
end

return M

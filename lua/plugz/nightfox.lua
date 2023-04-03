local M = {
    'EdenEast/nightfox.nvim',
    lazy = false,
    enabled = true,
}

M.config = function()
    require 'nightfox'.setup {
        options = {
            transparent = true,
            dim_inactive = false,
        },
    }

    vim.cmd.colorscheme 'nightfox'
end

return M
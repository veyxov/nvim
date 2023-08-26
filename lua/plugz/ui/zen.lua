local M = {
    'folke/zen-mode.nvim',
    keys = {
        {
            '<leader>c',
            function() require('zen-mode').toggle {} end,
        },
    },
}

M.config = function()
    require('zen-mode').setup {
        window = {
            width = 0.69,
        }
    }
end

return M

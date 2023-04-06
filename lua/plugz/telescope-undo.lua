local M = {
    "debugloop/telescope-undo.nvim",
    keys = {
        { '<leader>u', '<cmd>Telescope undo<cr>' }
    }
}

M.config = function()
    require 'telescope'.load_extension 'undo'
end

return M

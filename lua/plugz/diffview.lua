local M = {
        'sindrets/diffview.nvim',
        cmd = { 'Diffview', 'DiffviewOpen', 'DiffviewFileHistory' }
}

M.config = function()
        -- Lua
        require("diffview").setup() -- TODO: Tinker
end

return M

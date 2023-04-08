local M = {
    'sindrets/diffview.nvim',
    cmd = { 'Diffview', 'DiffviewOpen', 'DiffviewFileHistory' }
}

M.config = function()
    -- Lua
    local actions = require("diffview.actions")

    require("diffview").setup() -- TODO: Tinker
end

return M

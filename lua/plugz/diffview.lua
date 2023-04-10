local M = {
    'sindrets/diffview.nvim',
    cmd = { 'Diffview', 'DiffviewOpen', 'DiffviewFileHistory' }
}

M.config = function()
    require("diffview").setup()     -- TODO: Tinker
end

return M

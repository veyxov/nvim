local M = {
    'sindrets/diffview.nvim',
}

M.cmd = { 'Diffview', 'DiffviewOpen', 'DiffviewFileHistory' }

M.config = function()
    require("diffview").setup() -- TODO: Tinker
end

return M

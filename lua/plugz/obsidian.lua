local M = {
    'epwalsh/obsidian.nvim',
    lazy = false
}

M.config = function()
    require("obsidian").setup({
        dir = "~/Obsidian_Vaults/",
        completion = {
            nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        }
    })
end

return M

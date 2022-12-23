local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "InsertEnter",
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "json", "c_sharp" },
        highlight = { enable = true },
        indent = { enable = false },
    })
end

return M


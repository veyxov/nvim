local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'InsertEnter',
    opts = {
        highlight = { enable = true }
    }
}
return M

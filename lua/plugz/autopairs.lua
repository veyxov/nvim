local M = {
    'windwp/nvim-autopairs',
    even = "InsertEnter"
}

M.config = function()
    local lbls = 'nwyeisart'
    require("nvim-autopairs").setup {
        fast_wrap = {
            map = '<C-w>', -- mnemonic: control wrap
            keys = lbls,
            end_key = 'o'
        }
    }
    -- Handy on class declaration
    vim.keymap.set('i', '{{', '<space>{<cr>}<esc>O')
end

return M

local M = {
    "glepnir/lspsaga.nvim",
    event = "InsertEnter"
}

M.config = function()
    local saga = require('lspsaga')

    saga.init_lsp_saga()

    -- Diagnostic keymaps
    vim.keymap.set('n', 'dn',        vim.diagnostic.goto_prev)
    vim.keymap.set('n', 'dN',        vim.diagnostic.goto_next)

    vim.keymap.set("n", 'lr', '<cmd>Lspsaga rename<cr>')
    vim.keymap.set("n", '<cr>a', '<cmd>Lspsaga code_action<cr>')

    vim.keymap.set('n', 'ld', vim.lsp.buf.definition)
    vim.keymap.set('n', 'lD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'li', vim.lsp.buf.implementation)
    vim.keymap.set('i', '<C-e>', vim.lsp.buf.signature_help)

    vim.keymap.set('n', '<cr>f', "<cmd>Format<cr>") -- Format code using LSP

end

return M

local M = {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga"
}

M.init = function()
    -- Diagnostic keymaps
    vim.keymap.set('n', 'dn',        vim.diagnostic.goto_prev)
    vim.keymap.set('n', 'dN',        vim.diagnostic.goto_next)

    -- Lspsaga
    vim.keymap.set("n", 'lr', '<cmd>Lspsaga rename<cr>')
    vim.keymap.set("n", '<cr>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set("n", 'K', '<cmd>Lspsaga hover_doc<cr>')

    -- Builtin lsp
    vim.keymap.set('n', 'ld', vim.lsp.buf.definition)
    vim.keymap.set('n', 'lD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'li', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'lf', vim.lsp.buf.references)
    vim.keymap.set('i', '<C-e>', vim.lsp.buf.signature_help)

    -- Custom
    vim.keymap.set('n', '<cr>f', "<cmd>Format<cr>") -- Format code using LSP

end

M.config = function()
    local saga = require('lspsaga')

    saga.init_lsp_saga({
        code_action_lightbulb = { enable = false }
    })
end

return M

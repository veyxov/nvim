local M = {
    'neovim/nvim-lspconfig',
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/nvim-cmp" }
}
function M.config()
    local lsp = require 'lspconfig'

    -- C#
    require'lspconfig'.csharp_ls.setup {
        cmd = { "csharp-ls" },
        filetypes = { "cs" },
        single_file_support = true,
        on_attach = on_attach,
    }

    -- Typescript
    require'lspconfig'.tsserver.setup{}


    -- Diagnostic keymaps
    vim.keymap.set('n', 'dn',        vim.diagnostic.goto_prev)
    vim.keymap.set('n', 'dN',        vim.diagnostic.goto_next)

    -- Lspsaga
    vim.keymap.set("n", 'lr', '<cmd>Lspsaga rename<cr>')
    vim.keymap.set("n", '<cr>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set("n", 'K', '<cmd>Lspsaga hover_doc<cr>')

    -- Builtin lsp
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
    vim.keymap.set('n', '<cr>D', vim.lsp.buf.declaration)
    vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'lf', vim.lsp.buf.references)
    vim.keymap.set('i', '<C-e>', vim.lsp.buf.signature_help)

    -- Custom
    vim.keymap.set('n', '<cr>f', "<cmd>Format<cr>") -- Format code using LSP

end

return M

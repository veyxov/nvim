local M = {
    'neovim/nvim-lspconfig',
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/nvim-cmp" }
}

function M.config()
    local lsp = require 'lspconfig'

    -- C#
    lsp.csharp_ls.setup {
        cmd = { "csharp-ls" },
        filetypes = { "cs" },
        single_file_support = true,
        on_attach = on_attach,
    }

    -- Typescript
    lsp.tsserver.setup{}

    lsp.sumneko_lua.setup{}

    vim.keymap.set("n", "<cr>f", function() vim.lsp.buf.format()end)
end

return M

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
end

return M

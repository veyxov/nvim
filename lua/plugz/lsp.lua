local M = {
    'neovim/nvim-lspconfig',
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/nvim-cmp", "Decodetalkers/csharpls-extended-lsp.nvim" }
}

function M.config()
    local lsp = require 'lspconfig'

    -- C#
    lsp.csharp_ls.setup {
        cmd = { "csharp-ls" },
        filetypes = { "cs", "solution" },
        single_file_support = true,
        on_attach = on_attach,
        root_dir = lsp.util.root_pattern('.git', '.sln') or vim.loop.os_homedir(),
        handlers = {
            ["textDocument/definition"] = require('csharpls_extended').handler,
        },
    }

    -- Typescript
    lsp.tsserver.setup {}

    -- Lua
    lsp.sumneko_lua.setup {}

    -- Rust
    lsp.rust_analyzer.setup {}

    vim.keymap.set("n", "<cr>f", function() vim.lsp.buf.format() end)
    vim.keymap.set("i", "<C-E>", function() vim.lsp.buf.signature_help() end)
end

return M

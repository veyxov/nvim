local M = {
    'neovim/nvim-lspconfig',
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/nvim-cmp" }
}

function M.config()
    local lsp = require 'lspconfig'

    -- C#
    lsp.csharp_ls.setup {
        cmd = { "csharp-ls"  },
        filetypes = { "cs", "solution" },
        single_file_support = true,
        on_attach = on_attach,
        root_dir = lsp.util.root_pattern('.git', '.sln') or vim.loop.os_homedir()
    }

    -- Typescript
    lsp.tsserver.setup {}

    -- Lua
    lsp.sumneko_lua.setup {}

    -- Rust
    lsp.rust_analyzer.setup {}

    vim.keymap.set("n", "<cr>f", function() vim.lsp.buf.format() end)
end

return M

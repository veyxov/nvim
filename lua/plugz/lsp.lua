local M = {
    'neovim/nvim-lspconfig',
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/nvim-cmp",
        "Decodetalkers/csharpls-extended-lsp.nvim"
    }
}

function M.config()
    local lsp = require 'lspconfig'

    --golang
    lsp.gopls.setup {}

    -- C#
    lsp.csharp_ls.setup {
        cmd = { "csharp-ls" },
        filetypes = { "cs", "solution" },
        single_file_support = true,
        on_attach = on_attach,
        root_dir =
            lsp.util.root_pattern('.git', '.sln')
            or
            vim.loop.os_homedir(),

        handlers = {
            ["textDocument/definition"] = require 'csharpls_extended'.handler,
        },
    }

    -- Typescript
    lsp.tsserver.setup {}

    -- Lua
    require 'lspconfig'.lua_ls.setup {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    -- Rust
    lsp.rust_analyzer.setup {}

    vim.keymap.set("n", "<cr>f", function() vim.lsp.buf.format() end)
    vim.keymap.set("i", "<C-E>", function() vim.lsp.buf.signature_help() end)
end

return M

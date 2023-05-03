local M = {
    'neovim/nvim-lspconfig'
}

M.event = 'InsertEnter'

function M.config()
    local lsp = require 'lspconfig'

    -- C#
    lsp.csharp_ls.setup {
        cmd = { 'csharp-ls' },
        filetypes = { 'cs', 'solution' },
        on_attach = on_attach,
        root_dir =
            lsp.util.root_pattern('.git', '.sln')
            or
            vim.loop.os_homedir(),
    }

    -- Typescript
    lsp.tsserver.setup {}

    -- C++
    lsp.clangd.setup {}

    -- Lua
    require 'lspconfig'.lua_ls.setup {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                telemetry = {
                    enable = false,
                }
            },
        },
    }

    -- Rust
    lsp.rust_analyzer.setup {}

    local map = require 'globals'.Map

    map('<cr>t', '<cmd>Telescope lsp_definitions theme=dropdown<cr>', { 'n', 'v' })
    map('<leader>s', '<cmd>Telescope lsp_references theme=dropdown<cr>', { 'n', 'v' });
    map('<cr>i', '<cmd>Telescope lsp_implementations theme=dropdown<cr>', { 'n', 'v' });

    map('<cr>a', vim.lsp.buf.code_action, { 'n', 'v' })
    map('<cr>f', vim.lsp.buf.format)
    map('<cr>r', vim.lsp.buf.rename)
    map('<C-E>', vim.lsp.buf.signature_help, 'i')

    map('<S-k>', vim.lsp.buf.hover)
    map('<cr>r', vim.lsp.buf.rename)
end

return M

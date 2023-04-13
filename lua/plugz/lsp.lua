local M = {
    'neovim/nvim-lspconfig',
    event = 'InsertEnter'
}

function M.config()
    local lsp = require 'lspconfig'

    --golang
    lsp.gopls.setup {}

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

    map('<cr>a', function() vim.lsp.buf.code_action { apply = true } end, { 'n', 'v' })
    map('<cr>t', '<cmd>Telescope lsp_definitions theme=dropdown<cr>', { 'n', 'v' })
    map('<leader>s', '<cmd>Telescope lsp_references theme=dropdown<cr>', { 'n', 'v' });
    map('<cr>i', '<cmd>Telescope lsp_implementations theme=dropdown<cr>', { 'n', 'v' });
    map('<cr>f', function() vim.lsp.buf.format() end)
    map('<cr>r', function() vim.lsp.buf.rename() end)
    map('<C-E>', function() vim.lsp.buf.signature_help() end, 'i')

    map('<S-k>', function() vim.lsp.buf.hover() end, 'n')
    map('<cr>r', function() vim.lsp.buf.rename() end)
end

return M

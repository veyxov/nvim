local M = {
    'neovim/nvim-lspconfig',
}

M.event = 'InsertEnter'

function M.config()
    local lsp = require 'lspconfig'

    -- Typescript
    lsp.tsserver.setup {}

    -- C++
    lsp.clangd.setup {}

    -- Tailwind
    lsp.tailwindcss.setup {}

    -- Svelte
    lsp.svelte.setup {}

    -- Lua
    require('lspconfig').lua_ls.setup {
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
                },
            },
        },
    }

    -- Rust
    lsp.rust_analyzer.setup {
        settings = {
            ['rust-analyzer'] = {
                check = {
                    command = 'clippy',
                },
            },
        },
    }

    -- Golang
    lsp.gopls.setup {}

    local map = require('globals').Map

    map(
        '<leader>t',
        '<cmd>Telescope lsp_definitions theme=dropdown<cr>',
        { 'n', 'v' }
    )
    map(
        '<leader>u', -- semantic for usages
        '<cmd>Telescope lsp_references theme=dropdown<cr>',
        { 'n', 'v' }
    )
    map(
        '<leader><leader>',
        '<cmd>Telescope lsp_implementations theme=dropdown<cr>',
        { 'n', 'v' }
    )

    map('yf', vim.lsp.buf.format)
    map('ya', vim.lsp.buf.code_action, { 'n', 'v' })
    map('yr', vim.lsp.buf.rename)

    map('<C-E>', vim.lsp.buf.signature_help, 'i')

    map('<leader>k', vim.lsp.buf.hover)

    map('ko', vim.diagnostic.goto_next)
end

return M

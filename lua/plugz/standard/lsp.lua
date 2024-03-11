local M = {
    'neovim/nvim-lspconfig',
}

M.event = 'VeryLazy'

local function configure_mappings()
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

    local bf = vim.lsp.buf
    map('yf', bf.format)
    map('ya', bf.code_action, { 'n', 'v' })
    map('yr', bf.rename)

    map('<C-E>', bf.signature_help, 'i')

    map('<leader>k', bf.hover)

    map('ko', vim.diagnostic.goto_next)
end

local function configure_servers(lsp)
    -- Lua
    lsp.lua_ls.setup {
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

    -- TODO: play around with roslyn.nvim
    lsp.omnisharp.setup { cmd = { '/usr/bin/omnisharp' } }
end

function M.config()
    local lsp = require 'lspconfig'

    configure_servers(lsp)
    configure_mappings()
end

return M

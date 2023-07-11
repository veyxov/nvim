local M = {
    'neovim/nvim-lspconfig',
}

M.event = 'InsertEnter'

M.dependencies = {
    {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = function()
            require('lsp_lines').setup()
        end,
    },
}

function M.config()
    local lsp = require 'lspconfig'

    -- -- C#
    -- lsp.csharp_ls.setup {
    --     cmd = { 'csharp-ls' },
    --     filetypes = { 'cs', 'solution' },
    --     on_attach = on_attach,
    --     root_dir = lsp.util.root_pattern('.git', '.sln')
    --         or vim.loop.os_homedir(),
    -- }
    lsp.omnisharp.setup {
        cmd = { '/usr/bin/omnisharp' },
        on_attach = function(client, _)
            -- This is a hack that is needed with omnisharp in it's current state. This the result of a bug in Rosyln.
            client.server_capabilities.semanticTokensProvider.legend = {
                tokenModifiers = { 'static' },
                tokenTypes = {
                    'comment',
                    'excluded',
                    'identifier',
                    'keyword',
                    'keyword',
                    'number',
                    'operator',
                    'operator',
                    'preprocessor',
                    'string',
                    'whitespace',
                    'text',
                    'static',
                    'preprocessor',
                    'punctuation',
                    'string',
                    'string',
                    'class',
                    'delegate',
                    'enum',
                    'interface',
                    'module',
                    'struct',
                    'typeParameter',
                    'field',
                    'enumMember',
                    'constant',
                    'local',
                    'parameter',
                    'method',
                    'method',
                    'property',
                    'event',
                    'namespace',
                    'label',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'xml',
                    'regexp',
                    'regexp',
                    'regexp',
                    'regexp',
                    'regexp',
                    'regexp',
                    'regexp',
                    'regexp',
                    'regexp',
                },
            }
        end,
    }

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
    lsp.rust_analyzer.setup {}
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

    map('<F5>', vim.lsp.buf.code_action, { 'n', 'v' })
    map('<leader>f', vim.lsp.buf.format)
    map('<leader>r', vim.lsp.buf.rename)
    map('<C-E>', vim.lsp.buf.signature_help, 'i')

    map('<leader>k', vim.lsp.buf.hover)
end

return M

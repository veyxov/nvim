local M = {
    'neovim/nvim-lspconfig',
    event = 'InsertEnter',
    dependencies = {
        'Decodetalkers/csharpls-extended-lsp.nvim',
        'hrsh7th/nvim-cmp'
    }
}

function M.config()
    local lsp = require 'lspconfig'

    --golang
    lsp.gopls.setup {}

    -- C#
    lsp.csharp_ls.setup {
        cmd = { 'csharp-ls' },
        filetypes = { 'cs', 'solution' },
        single_file_support = true,
        on_attach = on_attach,
        root_dir =
            lsp.util.root_pattern('.git', '.sln')
            or
            vim.loop.os_homedir(),

        handlers = {
            ['textDocument/definition'] = require 'csharpls_extended'.handler,
        },
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

    vim.keymap.set({ 'n', 'v' }, '<cr>a', function() vim.lsp.buf.code_action { apply = true } end)
    vim.keymap.set({ 'n', 'v' }, '<cr>t', '<cmd>Telescope lsp_definitions theme=dropdown<cr>')
    vim.keymap.set({ 'n', 'v' }, '<leader>s', '<cmd>Telescope lsp_references theme=dropdown<cr>');
    vim.keymap.set({ 'n', 'v' }, '<cr>i', '<cmd>Telescope lsp_implementations theme=dropdown<cr>');
    vim.keymap.set('n', '<cr>f', function() vim.lsp.buf.format() end)
    vim.keymap.set('i', '<C-E>', function() vim.lsp.buf.signature_help() end)

    vim.keymap.set('n', '<S-k>', function() vim.lsp.buf.hover() end)
    vim.keymap.set('n', '<cr>r', function() vim.lsp.buf.rename() end)
end

return M

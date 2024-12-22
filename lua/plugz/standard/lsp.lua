local M = {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
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
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    lsp.omnisharp.setup {
    capabilities = capabilities,
    cmd = { "/usr/bin/omnisharp"},
    settings = {
      FormattingOptions = {
        EnableEditorConfigSupport = false,
      },
      RoslynExtensionsOptions = {
        EnableImportCompletion = true,
      },
      Sdk = {
        IncludePrereleases = true,
      },
    }
}
end

function M.config()
    local lsp = require 'lspconfig'

    configure_servers(lsp)
    configure_mappings()
end

return M

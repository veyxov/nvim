local M = {
    'neovim/nvim-lspconfig',
    dependencies = { 
        'saghen/blink.cmp',
        {
            'Hoffs/omnisharp-extended-lsp.nvim'
        }
    },
}

M.event = 'VeryLazy'

local function configure_mappings()
    local map = require('globals').Map
    map(
        '<leader>t',
        "<cmd>lua require('omnisharp_extended').telescope_lsp_definition({ jump_type = 'vsplit' })<cr>",
        { 'n', 'v' }
    )
    map(
        '<leader>u', -- semantic for usages
        "<cmd>lua require('omnisharp_extended').telescope_lsp_references()<cr>",
        { 'n', 'v' }
    )
    map(
        '<leader><leader>',
        "<cmd>lua require('omnisharp_extended').telescope_lsp_implementation()<cr>",
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

local function configure_servers()
    vim.lsp.enable({'gopls', 'omnisharp'})
end

function M.config()
    configure_servers()
    configure_mappings()
end

return M

local M = {
    'neovim/nvim-lspconfig',
    keys = {
        { "<leader>t", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "<leader>u", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "<leader><leader>", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    },
    event = 'VeryLazy'
}

local function configure_mappings()
    local map = require('globals').Map

    local bf = vim.lsp.buf
    map('yf', bf.format)
    map('ya', bf.code_action, { 'n', 'v' })
    map('yr', bf.rename)

    map('<C-E>', bf.signature_help, 'i')

    map('<leader>k', bf.hover)

    map('ko', vim.diagnostic.goto_next)
end

function M.config()
    configure_mappings()
end

return M

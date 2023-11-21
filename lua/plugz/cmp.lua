local M = {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
}

M.dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
}

function M.config()
    local cmp = require 'cmp'

    -- Load copilot-cmp before cmp loads
    ---@diagnostic disable-next-line: undefined-field
    require('lazy').load { plugins = { 'copilot.lua', 'copilot-cmp' } }

    local cmp_acccept_function = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.confirm { select = true }
        elseif vim.snippet.jumpable(1) then
            vim.snippet.jump(1)
        else
            fallback()
        end
    end, { 'i', 's' })

    ---@diagnostic disable-next-line: redundant-parameter
    cmp.setup {
        snippet = {
            expand = function(args) vim.snippet.expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert {
            ['<Right>'] = cmp_acccept_function,
            ['<C-c>'] = cmp.mapping.close(),
        },
        sources = cmp.config.sources {
            { name = 'copilot' },
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
        },
    }
end

return M

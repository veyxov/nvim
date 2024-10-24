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

    local cmp_acccept_function = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.confirm { select = true }
        elseif vim.snippet.active() then
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
            ['<Right>'] = cmp_acccept_function
        },
        sources = cmp.config.sources {
            { name = 'nvim_lsp' },
            { name = 'buffer' }
        },
    }
end

return M

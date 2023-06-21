local cmp_integration = function()
    local cmp = require 'cmp'
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

local Autopairs = {
    'windwp/nvim-autopairs',
    keys = {
        { '(', mode = 'i' },
        { '[', mode = 'i' },
        { '{', mode = 'i' },
        { '"', mode = 'i' },
        { "'", mode = 'i' },
    },
    config = function()
        require('nvim-autopairs').setup {}

        cmp_integration()
    end,
}

local Autotags = {
    'windwp/nvim-ts-autotag',
    ft = { 'svelte', 'js', 'ts', 'html', 'vue' },
    config = function()
        require('nvim-ts-autotag').setup()
    end,
}

return { Autopairs, Autotags }

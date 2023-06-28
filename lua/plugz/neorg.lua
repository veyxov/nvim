return {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    lazy = false,
    config = function()
        require('neorg').setup {
            load = {
                ['core.defaults'] = {}, -- Loads default behaviour
                ['core.concealer'] = {}, -- Adds pretty icons to your documents
                ['core.dirman'] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            generic = '~/notes/generic',
                            work = '~/notes/work',
                        },
                        defalt_workspace = 'generic',
                    },
                },
            },
        }
    end,
}

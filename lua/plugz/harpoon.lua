local M = {
    'ThePrimeagen/harpoon',
    -- TODO: remove this once not needed
    branch = 'harpoon2',
    keys = {
        '<leader>a',
        '<C-e>',
        'yu',
        'yo',
        'yy',
        'yk',
    },
}

M.config = function()
    local hp = require 'harpoon'
    local map = require('globals').Map
    hp:setup()

    map('<leader>a', function() hp:list():append() end)
    map('<C-e>', function() hp.ui:toggle_quick_menu(hp:list()) end)

    map('yu', function() hp:list():select(1) end)
    map('yo', function() hp:list():select(2) end)
    map('yy', function() hp:list():select(3) end)
    map('yk', function() hp:list():select(4) end)
end

return M

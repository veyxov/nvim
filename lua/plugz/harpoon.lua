local M = {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
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
    local harpoon = require("harpoon")
    local map = require("globals").Map
    harpoon:setup()

    map("<leader>a", function() harpoon:list():append() end)
    map("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    map("yu", function() harpoon:list():select(1) end)
    map("yo", function() harpoon:list():select(2) end)
    map("yy", function() harpoon:list():select(3) end)
    map("yk", function() harpoon:list():select(4) end)
end

return M

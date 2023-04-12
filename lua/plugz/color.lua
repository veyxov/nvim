local M = {
    "neanias/everforest-nvim",
    event = 'VeryLazy',
    config = function()
        local everforest = require 'everforest'

        everforest.setup{
            italics = true
        }

        everforest.load()
    end,
}

return M

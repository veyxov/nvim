local mode = { 'n', 'o', 'v' }
local lbls = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't', 'p', 'l' }
local safe_lbls = { 'n', 'e', 's', 'r', 't', 'p', 'l' }

local Flint = {
    "ggandor/flit.nvim",
    keys = {
        { 'f', mode = mode },
        { 'F', mode = mode },
        { 't', mode = mode },
        { 'T', mode = mode },
    },
    config = function()
        require 'flit'.setup {
            labeled_modes = "nvo",
            multiline = false,
            opts = {
                safe_labels = safe_lbls,
                labels = lbls,
            },
        }
    end
}

local Leap = {
    "ggandor/leap.nvim",
    keys = {
        { 's', mode = mode },
        { 'S', mode = mode }
    },
    config = function()
        local leap = require 'leap'

        leap.add_default_mappings()
        leap.opts.labels = lbls
        leap.opts.safe_labels = safe_lbls
    end
}

return {
    Leap,
    Flint
}

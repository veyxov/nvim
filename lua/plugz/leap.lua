local M = {
    "ggandor/leap.nvim",
    keys = { 's', 'S' }
}

function M.config()
    local lbls = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }

    local leap = require 'leap'

    leap.add_default_mappings()
    leap.opts.safe_labels = lbls
    leap.opts.labels = lbls
end

return M

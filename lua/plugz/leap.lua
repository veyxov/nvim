local M = {
    "ggandor/leap.nvim",
    keys = { 's', 'S' }
}

function M.config()
    local lbls = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't', 'p', 'l' }
    local safe_lbls = { 'n', 'e', 's', 'r', 't', 'p', 'l' }

    local leap = require 'leap'

    leap.add_default_mappings()
    leap.opts.labels = lbls
    leap.opts.safe_labels = safe_lbls
end

return M

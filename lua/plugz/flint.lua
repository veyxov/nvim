local mode = { 'n', 'o', 'v' }

local M = {
    "ggandor/flit.nvim",
    keys = {
        { 'f', mode = mode },
        { 'F', mode = mode },
        { 't', mode = mode },
        { 'T', mode = mode },
    }
}

function M.config()
    local lbls = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }

    require 'flit'.setup {
        labeled_modes = "nvo",
        multiline = false,
        opts = {
            safe_labels = lbls,
            labels = lbls,
        },
    }
end

return M

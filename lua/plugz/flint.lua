local M = {
    "ggandor/flit.nvim",
    keys = { 'f', 'F', 't', 'T' }
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

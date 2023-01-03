local M = {
    "andersevenrud/nordic.nvim",
    event = "InsertEnter"
}

M.config = function()
    require('nordic').colorscheme({
        -- Italic styled comments
        italic_comments = true,
    })
end

return M

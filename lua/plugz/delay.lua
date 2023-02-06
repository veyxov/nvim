local M = {
    "ja-ford/delaytrain.nvim",
    lazy = false
}

M.config = function()
    require 'delaytrain'.setup {
        keys = {
            ['nvi'] = { '<Left>', '<Down>', '<Up>', '<Right>', 'w', 'b', '<c-d>' },
        },
    }
end

return M

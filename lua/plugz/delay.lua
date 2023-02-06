local M = {
    "ja-ford/delaytrain.nvim",
    lazy = false
}

M.config = function()
    require 'delaytrain'.setup {
        keys = {
            ['nv'] = { '<Left>', '<Down>', '<Up>', '<Right>', 'w', 'b', 'e', '{', '}', '<c-d>' },
        },
    }
end

return M

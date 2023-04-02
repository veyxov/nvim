local M = {
    "rcarriga/nvim-notify",
    enabled = false,
    event = "VeryLazy",
    keys = {
        {
            "<leader>un",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Delete all Notifications",
        },
    },
}

M.init = function()
    vim.notify = require 'notify'
end

M.config = function()
    local opts = {
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        background_color = '#FF0000',
        stages = 'slide',
        render = "compact",
        highlights = {
            borders = 'none',
        }
    }

    require 'notify'.setup(opts)
end

return M

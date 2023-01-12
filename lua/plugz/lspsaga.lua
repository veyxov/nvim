local M = {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga"
}

M.init = function()
end

M.config = function()
    local saga = require('lspsaga')

    saga.init_lsp_saga({
        code_action_lightbulb = { enable = false }
    })
end

return M

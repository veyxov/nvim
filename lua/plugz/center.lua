local M = {
    "arnamak/stay-centered.nvim",
    event = "InsertEnter"
}

M.config = function()
    require 'stay-centered'
end

return M

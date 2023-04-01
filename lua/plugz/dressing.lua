local function load_dressing()
    require 'lazy'.load { plugins = { "dressing.nvim" } }
end

local M = {
    "stevearc/dressing.nvim",
    event = "VeryLazy"
}

-- Load the module when needed
M.init = function()
    vim.ui.select = function(...)
        load_dressing()
        return vim.ui.select(...)
    end
    vim.ui.input = function(...)
        load_dressing()
        return vim.ui.input(...)
    end
end

M.config = function()
    require 'dressing'.setup {
        input = {
            default_prompt = "> "
        }
    }
end
return M
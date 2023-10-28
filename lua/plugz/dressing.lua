-- Dressing
local function load_dressing()
    require('lazy').load { plugins = { 'dressing.nvim' } }
end

return {
    'stevearc/dressing.nvim',
    -- Load the module when needed
    init = function()
        vim.ui.select = function(...)
            load_dressing()
            return vim.ui.select(...)
        end
        vim.ui.input = function(...)
            load_dressing()
            return vim.ui.input(...)
        end
    end,

    config = function()
        require('dressing').setup {
            input = {
                start_in_insert = false,
                border = 'solid',
            },
            select = {
                backend = { 'telescope' },
            },
        }
    end,
}

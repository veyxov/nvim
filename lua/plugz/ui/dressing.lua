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
                default_prompt = '> ',
                border = 'single',
                prompt_align = 'center',
                relative = 'win',
            },
        }
    end,
}

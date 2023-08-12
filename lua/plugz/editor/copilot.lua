local Copilot = {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
}

local CmpSource = {
    'zbirenbaum/copilot-cmp',
    config = function() require('copilot_cmp').setup() end,
}

Copilot.config = function()
    require('copilot').setup {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = '<A-Right>',
            },
        },
    }
end

return { Copilot, CmpSource }

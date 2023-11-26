local Copilot = {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = '<Right>',
            },
        },
    },
}

local CmpSource = {
    'zbirenbaum/copilot-cmp',
    opts = {},
}

return { Copilot, CmpSource }

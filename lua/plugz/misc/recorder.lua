local recording = '<leader>mm'
local play = '<leader>me' -- execute
local switch = '<leader>ms'
local edit = '<leader>mc' -- change

return {
    'chrisgrieser/nvim-recorder',
    keys = {
        recording,
        play,
        switch,
        edit,
    },
    config = function()
        -- default values
        require('recorder').setup {
            timeout = 1500,
            slots = { 'a', 'e' },

            mapping = {
                startStopRecording = recording,
                playMacro = play,
                switchSlot = switch,
                editMacro = edit,
                yankMacro = '<leader>my',
                addBreakPoint = '##', -- ⚠️ this should be a string you don't use in insert mode during a macro
            },

            -- Clears all macros-slots on startup.
            clear = false,

            -- If enabled, only critical notifications are sent.
            -- If you do not use a plugin like nvim-notify, set this to `true`
            -- to remove otherwise annoying messages.
            lessNotifications = true,

            useNerdfontIcons = false,

            performanceOpts = {
                countThreshold = 10,
                lazyredraw = true,
                noSystemClipboard = true,
                autocmdEventsIgnore = { -- temporarily ignore these autocmd events
                    'TextChangedI',
                    'TextChanged',
                    'InsertLeave',
                    'InsertEnter',
                    'InsertCharPre',
                },
            },
        }
    end,
}

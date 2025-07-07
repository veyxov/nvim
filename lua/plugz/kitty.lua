return {
    'mikesmithgh/kitty-scrollback.nvim',
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
    event = { 'User KittyScrollbackLaunch' },
    config = function()
        require('kitty-scrollback').setup()
    end,
}

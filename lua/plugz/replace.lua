return {
    'MagicDuck/grug-far.nvim',
    config = function()
        require('grug-far').setup({
            windowCreationCommand = 'tabnew %',
            keymaps = {
                replace = { n = '<localleader>r' },
                qflist = { n = '<localleader>q' },
                syncLocations = { n = '<localleader>s' },
                syncLine = { n = '<localleader>l' },
                close = { n = '<localleader>c' },
                historyOpen = { n = '<localleader>t' },
                historyAdd = { n = '<localleader>a' },
                refresh = { n = '<localleader>f' },
                gotoLocation = { n = '<enter>' },
                pickHistoryEntry = { n = '<enter>' },
                abort = { n = '<localleader>b' },
            }
        })
    end,
    keys = {
        { '<leader>R', '<cmd>GrugFar<cr>' }
    }
}


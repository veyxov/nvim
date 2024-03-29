-- Download lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    }
end

-- Add lazyness to the runtime
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup('plugz', {
    defaults = { lazy = true },
    lockfile = vim.fn.stdpath 'data' .. '/lazy-lock.json', -- hide lockfile away
    ui = { size = { width = 1, height = 1 } }, -- full screen
    performance = {
        rtp = {
            disabled_plugins = {
                'osc52',
                'gzip',
                'matchit',
                'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
                'spellfile',
                'rplugin',
                'editorconfig',
            },
        },
    },
})

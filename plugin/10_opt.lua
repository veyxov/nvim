local o = vim.o

Cfg.now(function()
        require 'mini.basics'.setup({
                options = { extra_ui = true },
                autocommands = { basic = false }
        })
end)

o.swapfile = false
o.undofile = true
o.shada = "'20,<50,s10,h"

o.cmdheight = 0
o.laststatus = 3

o.expandtab = true

Cfg.au('TextYankPost', { pattern = '*', callback = function() vim.highlight.on_yank() end })

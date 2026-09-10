local o = vim.o

o.shada = "'20,<10,s10,h"

o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4

o.laststatus = 0
o.cmdheight = 0
o.signcolumn = 'yes'

o.swapfile = false
o.updatetime = 250
o.timeoutlen = 400
o.confirm = true
o.inccommand = 'split'
o.autoread = true

vim.diagnostic.config {
  severity_sort = true,
  virtual_lines = { current_line = true },
}

-- autoread alone only checks on a few triggers; force it on focus/buffer entry
-- (matters with mini.git branch switches / external git pull)
autocmd({ 'FocusGained', 'BufEnter' }, 'autoread', { command = 'checktime' })

-- experimental (0.12): kills "Press ENTER to continue", ephemeral msg window
-- instead of the classic msg area -- fits cmdheight=0 better than the default
pcall(function() require('vim._core.ui2').enable() end)

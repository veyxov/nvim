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

vim.diagnostic.config {
  severity_sort = true,
  virtual_text = { prefix = '●' }
}

function _G.map(l, r, m, o)
    m = m or 'n'
    o = o or { silent = true }
    vim.keymap.set(m, l, r, o)
end

require 'options'
require 'plugins'
require 'keymaps'

vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
    source = "if_many",
    prefix = "●",
    virt_text_pos = "eol",
    hl_mode = "combine",
  },
})
vim.cmd 'colorscheme retrobox'

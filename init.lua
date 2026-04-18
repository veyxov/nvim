require 'vim._core.ui2'.enable()

function _G.map(l, r, m, o)
    m = m or 'n'
    o = o or { silent = true }
    vim.keymap.set(m, l, r, o)
end

require 'options'
require 'plugins'
require 'keymaps'

vim.cmd 'colorscheme minicyan'

--{{{surround
--}}}

--{{{ jump2d
--}}}

--{{{jump
require 'mini.jump'.setup({
  mappings = {
    forward       = 'f',
    backward      = 'F',
    -- can't use these, because using t as the second Leader key
    forward_till  = '',
    backward_till = '',
  },
})
--}}}

--{{{ui
require 'mini.indentscope'.setup()
require 'mini.cmdline'    .setup()
require 'mini.diff'       .setup()
require 'mini.map'.setup()
--}}}

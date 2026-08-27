vim.pack.add({ { src = gh('mikesmithgh/kitty-scrollback.nvim') } })

later(function() require('kitty-scrollback').setup() end)

pack 'folke/flash.nvim'

local lbls = 'rsndwaeihtjfmpvxglcbuoyk./?\'_,:qz'

require 'flash'.setup {
    labels = lbls,
    modes = {
        treesitter = {
            labels = lbls,
        },
    }
}

map('s', function() require 'flash'.jump() end, { 'n', 'x', 'o' })

map('S', function() require 'flash'.treesitter() end, { 'n', 'x', 'o' })

map('r', function() require 'flash'.remote() end, 'o')

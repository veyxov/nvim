local Autotags = {
    'windwp/nvim-ts-autotag',
    ft = { 'svelte', 'js', 'ts', 'html', 'vue' },
    config = function() require('nvim-ts-autotag').setup() end,
}

return Autotags

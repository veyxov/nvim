return {
    'altermo/ultimate-autopair.nvim',
    keys = {
        { '(', mode = 'i' },
        { '{', mode = 'i' },
        { '[', mode = 'i' },
        { '"', mode = 'i' },
        { "'", mode = 'i' },
    },
    branch = 'v0.6',
    opts = {
        bs = {
            map = '<C-h>',
            cmap = '<C-h>',
        },
    },
}

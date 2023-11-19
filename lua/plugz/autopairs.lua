return {
    'altermo/ultimate-autopair.nvim',
    keys = {
        { '(', mode = 'i' },
        { '{', mode = 'i' },
        { '[', mode = 'i' },
        { '"', mode = 'i' },
        { "'", mode = 'i' },
    },
    opts = {
        bs = {
            map = '<C-h>',
            cmap = '<C-h>',
        },
    },
}

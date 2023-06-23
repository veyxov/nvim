return {
    'numToStr/Comment.nvim',
    keys = {
        'k',
        'kk',
        'kb',
        'kO',
        'ko',
        'K',
    },
    config = function()
        require('Comment').setup {
            opleader = {
                ---Line-comment keymap
                line = 'k',
                ---Block-comment keymap
                block = 'kb',
            },
            extra = {
                ---Add comment on the line above
                above = 'kO',
                ---Add comment on the line below
                below = 'ko',
                ---Add comment at the end of line
                eol = 'K',
            },

            toggler = {
                line = 'kk',
            },
        }
    end,
}
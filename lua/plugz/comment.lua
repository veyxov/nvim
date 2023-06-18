return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup {
            opleader = {
                ---Line-comment keymap
                line = 'k',
                ---Block-comment keymap
                block = 'gb',
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

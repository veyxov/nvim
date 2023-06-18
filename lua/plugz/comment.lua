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
            toggler = {
                line = 'kk',
            },
        }
    end,
}

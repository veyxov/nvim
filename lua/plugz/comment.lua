local M = {
    'numToStr/Comment.nvim',
    keys = {
        "gcc", "gC", "gc", "gb", "c0", "co", "cA", "gc", "cO", "co",
        { "gc", mode = "v" }
    }
}

M.config = function()
    require 'Comment'.setup {
        toggler = {
            ---Line-comment toggle keymap
            line = 'gcc',
            ---Block-comment toggle keymap
            block = 'gC',
        },
        opleader = {
            line = 'gc',
            block = 'gb',
        },
        extra = {
            ---Add comment on the line above
            above = 'cO',
            ---Add comment on the line below
            below = 'co',
            ---Add comment at the end of line
            eol = 'cA',
        },
        mappings = {
            basic = true,
            extra = true,
        },
    }
end

return M

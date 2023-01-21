local M = {
    'numToStr/Comment.nvim',
    keys = {
        "gcc", "gbc", "gc", "gb", "c0", "co", "cA"
    }
}

M.config = function()
    require("Comment").setup {
        toggler = {
            ---Line-comment toggle keymap
            line = 'gcc',
            ---Block-comment toggle keymap
            block = 'gbc',
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
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = true,
        },
    }
end

return M

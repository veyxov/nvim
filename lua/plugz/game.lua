return {
    'nagy135/typebreak.nvim',
    init = function()
        vim.keymap.set('n', '<leader>tb', require('typebreak').start, { desc = "Typebreak" })
    end
}

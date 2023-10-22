return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'VeryLazy',

    config = function()
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set('n', '<leader>fa', "za")
        vim.keymap.set('n', '<leader>ff', require('ufo').openAllFolds)
        vim.keymap.set('n', '<leader>fl', require('ufo').closeAllFolds)
        vim.keymap.set('n', '<leader>fn', require('ufo').goNextClosedFold)
        vim.keymap.set('n', '<leader>fx', "zE")
        vim.keymap.set('n', '<leader>ff', "zO")
        vim.keymap.set('n', '<leader>fe', "zC")
        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end
        })
    end
}

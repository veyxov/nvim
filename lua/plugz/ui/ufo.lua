return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'VeryLazy',

    config = function()
        vim.o.foldcolumn = '0'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 3
        vim.o.foldenable = true

        vim.keymap.set('n', '<leader>fa', 'za')
        vim.keymap.set('n', '<leader>fo', require('ufo').openAllFolds)
        vim.keymap.set('n', '<leader>fc', require('ufo').closeAllFolds)
        vim.keymap.set('n', '<leader>fn', require('ufo').goNextClosedFold)
        require('ufo').setup {
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end,
        }
    end,
}

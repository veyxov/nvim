local GROUP = vim.api.nvim_create_augroup('VEYXOV_GROUP', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = GROUP,
    pattern = '*',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
    group = GROUP,
    pattern = "*"
})

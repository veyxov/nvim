local GROUP = vim.api.nvim_create_augroup('VEYXOV_GROUP', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = GROUP,
    pattern = '*',
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = GROUP,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
-- Format before writing
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
    group = GROUP,
    pattern = "*"
})

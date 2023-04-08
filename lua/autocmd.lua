local GROUP = vim.api.nvim_create_augroup('VEYXOV_GROUP', { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd('TextYankPost', {
        callback = function()
                vim.highlight.on_yank()
        end,
        group = GROUP,
        pattern = '*',
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
        group = GROUP,
        callback = function()
                vim.cmd("tabdo wincmd =")
        end,
})

-- Go to last loc when opening a buffer
autocmd("BufReadPost", {
        group = GROUP,
        callback = function()
                local mark = vim.api.nvim_buf_get_mark(0, '"')
                local lcount = vim.api.nvim_buf_line_count(0)
                if mark[1] > 0 and mark[1] <= lcount then
                        pcall(vim.api.nvim_win_set_cursor, 0, mark)
                end
        end,
})

-- Format before writing
autocmd('BufWritePre', {
        callback = function()
                vim.lsp.buf.format({ async = false })
        end,
        group = GROUP,
        pattern = "*"
})

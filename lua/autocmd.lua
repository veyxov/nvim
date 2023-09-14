local GROUP = vim.api.nvim_create_augroup('VEYXOV_GROUP', { clear = true })

-- Helper function
local function autocmd(event, callback)
    vim.api.nvim_create_autocmd(event, { callback = callback, group = GROUP })
end

-- Highlight on yank
autocmd('TextYankPost', function() vim.highlight.on_yank() end)

-- Resize splits if window got resized
autocmd('VimResized', function() vim.cmd 'tabdo wincmd =' end)

-- Go to last loc when opening a buffer
autocmd('BufReadPost', function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
end)

local GROUP = vim.api.nvim_create_augroup('VEYXOV_GROUP', {})

local function autocmd(event, callback)
    vim.api.nvim_create_autocmd(event, { callback = callback, group = GROUP })
end

autocmd('TextYankPost', function() vim.highlight.on_yank() end)

-- Go to last loc when opening a buffer
autocmd('BufReadPost', function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
end)

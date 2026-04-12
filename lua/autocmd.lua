local g = vim.api.nvim_create_augroup('xyz', { clear = true })

function cmd(ev, f, gr)
    vim.api.nvim_create_autocmd(ev, {
        group = gr,
        callback = f
    })
end

cmd('TextYankPost', function() vim.highlight.on_yank() end, g) 

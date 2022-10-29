local autocmd = vim.api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup('WEXOV', { clear = true })

-- If it's a configuration file, resource it.
autocmd('BufWritePost', {
    pattern = '*.lua',
    callback = function()
        vim.cmd "source <afile>"
        vim.cmd "PackerCompile"
    end,
    group = group,
})

-- Highlight the yanked area.
autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
    end,
    group = group,
})

-- Restart the keyboard configuration deamon
autocmd('BufWritePost', {
    pattern = '*.kbd',
    command = [[!sudo killall kmonad ; sudo kmonad -w 500 "$HOME/.config/keyboard/colex.kbd" & && xset r rate 300 50]],
    group = group,
})

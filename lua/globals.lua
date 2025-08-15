return {
    Map = function(l, r, m)
        m = m or 'n'
        vim.keymap.set(m, l, r)
    end,
}

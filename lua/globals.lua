local M = {
    -- Cartographer
    Map = function(lhs, rhs, mode)
        mode = mode or 'n' -- We are normal, most of the time
        vim.keymap.set(mode, lhs, rhs)
    end,
    Restart = function()
        -- Get current pane id
        local current_pane = os.getenv("WEZTERM_PANE")

        -- Spawn a new nvim instance and return to last position
        vim.fn.jobstart([[wezterm cli spawn -- nvim --cmd 'call feedkeys("\<C-o>")']])

        -- Kill the previous pane containing the old instance
        vim.fn.jobstart(string.format([[sleep 1; wezterm cli kill-pane --pane-id %s]], current_pane))
    end
}

return M

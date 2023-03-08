local M = {
    'folke/tokyonight.nvim',
    enabled = true,
    event = "InsertEnter"
}

M.config = function()
    require("tokyonight").setup({
        transparent = true,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true, italic = true },
            variables = {},
        },
        day_brightness = 0.3,             -- Adjusts the brightness of the colors of the Day style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.
    })
    vim.cmd.colorscheme 'tokyonight-night'
end

return M

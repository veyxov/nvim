local ox = { 'o', 'x' }
local M = {
    'chrisgrieser/nvim-various-textobjs',
    opts = {},
}

local mp = function(x, y)
    return string.format("<cmd>lua require('various-textobjs').%s(%s)<CR>", x, y)
end

M.keys = {
    {
        'dsi',
        function()
            require('various-textobjs').indentation(true, true)
            if vim.fn.mode():find 'V' == nil then return end

            vim.cmd.normal { '<', bang = true }
            vim.cmd(
                tostring(vim.api.nvim_buf_get_mark(0, '>')[1] + 1) .. ' delete'
            )
            vim.cmd(
                tostring(vim.api.nvim_buf_get_mark(0, '<')[1] - 1) .. ' delete'
            )
        end,
    },
    {
        'ag',
        mp("entireBuffer", ""),
        mode = ox,
    },
    {
        'ii',
        mp("indentation", "true, true"),
        mode = ox,
    },
    {
        'ai',
        mp("indentation", "false, false"),
        mode = ox,
    },
    {
        'ih',
        mp("subword", "true"),
        mode = ox,
    },
    {
        'ah',
        mp("subword", "false"),
        mode = ox,
    },
    {
        'ar',
        mp("value", "false"),
        mode = ox,
    },
    {
        'ir',
        mp("value", "true"),
        mode = ox,
    },
    {

        'ak',
        mp("key", "false"),
        mode = ox,
    },
    {

        'ik',
        mp("key", "true"),
        mode = ox,
    },
    {

        'im',
        mp("chainMember", "true"),
        mode = ox,
    },
    {
        'am',
        mp("chainMember", "false"),
        mode = ox,
    },
}

return M

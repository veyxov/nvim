local ox = { 'o', 'x' }
local M = {
    'chrisgrieser/nvim-various-textobjs',
    opts = {},
}

M.keys = {
    {
        'dsi',
        function()
            require('various-textobjs').indentation(true, true)
            if vim.fn.mode():find 'V' == nil then return end

            vim.cmd.normal { '<', bang = true }
            vim.cmd(tostring(vim.api.nvim_buf_get_mark(0, '>')[1] + 1) .. ' delete')
            vim.cmd(tostring(vim.api.nvim_buf_get_mark(0, '<')[1] - 1) .. ' delete')
        end,
    },
    {
        'ag',
        "<cmd>lua require('various-textobjs').entireBuffer()<CR>",
        mode = ox,
    },
    {
        'ii',
        "<cmd>lua require('various-textobjs').indentation(true, true)<CR>",
        mode = ox,
    },
    {
        'ai',
        "<cmd>lua require('various-textobjs').indentation(false, false)<CR>",
        mode = ox,
    },
    {
        'ih',
        "<cmd>lua require('various-textobjs').subword(true)<CR>",
        mode = ox,
    },
    {
        'ah',
        "<cmd>lua require('various-textobjs').subword(false)<CR>",
        mode = ox,
    },
    {
        'ar',
        "<cmd>lua require('various-textobjs').value(false)<CR>",
        mode = ox,
    },
    {
        'ir',
        "<cmd>lua require('various-textobjs').value(true)<CR>",
        mode = ox,
    },
    {

        'ak',
        "<cmd>lua require('various-textobjs').key(false)<CR>",
        mode = ox,
    },
    {

        'ik',
        "<cmd>lua require('various-textobjs').key(true)<CR>",
        mode = ox,
    },
    {

        'im',
        "<cmd>lua require('various-textobjs').chainMember(true)<CR>",
        mode = ox,
    },
    {
        'am',
        "<cmd>lua require('various-textobjs').chainMember(false)<CR>",
        mode = ox,
    },
}

return M

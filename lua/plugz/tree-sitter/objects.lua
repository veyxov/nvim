local ox = { 'o', 'x' }
local M = {
    'chrisgrieser/nvim-various-textobjs',
    config = function()
        require('various-textobjs').setup {
            lookForwardSmall = 25,

            lookForwardBig = 15,
        }

        vim.keymap.set("n", "dsi", function()
            -- select inner indentation
            require("various-textobjs").indentation(true, true)

            -- plugin only switches to visual mode when a textobj has been found
            local notOnIndentedLine = vim.fn.mode():find("V") == nil
            if notOnIndentedLine then return end

            -- dedent indentation
            vim.cmd.normal { "<", bang = true }

            -- delete surrounding lines
            local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1] + 1
            local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
            vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
            vim.cmd(tostring(startBorderLn) .. " delete")
        end, { desc = "Delete surrounding indentation" })
    end,
}

M.keys = {
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
        'ah',
        "<cmd>lua require('various-textobjs').subword(true)<CR>",
        mode = ox,
    },
    {
        'ih',
        "<cmd>lua require('various-textobjs').subword(false)<CR>",
        mode = ox,
    },
    {
        [[t']],
        "<cmd>lua require('various-textobjs').toNextQuotationMark()<CR>",
        mode = ox,
    },
    {
        'ax',
        "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>",
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
    {
        'gw',
        "<cmd>lua require('various-textobjs').visibleInWindow()<CR>",
        mode = ox,
    },
}

return M

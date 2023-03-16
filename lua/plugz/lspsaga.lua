local M = {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga",
    keys = {
        "<cr>t",
        "<cr>r",
        "<cr>a",
        "<leader>s",
        "<c-k>"
    }
}

M.config = function()
    local saga = require('lspsaga')

    saga.setup({
        lightbulb = { enable = false },
        preview = {
            lines_above = 0,
            lines_below = 10,
        },
        scroll_preview = {
            scroll_down = "<C-f>",
            scroll_up = "<C-b>",
        },
        request_timeout = 2000,
    })
    -- Code action
    vim.keymap.set({ "n", "v" }, "<cr>a", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<leader>s", "<cmd>Lspsaga lsp_finder<CR>")

    -- Code action
    vim.keymap.set({ "n", "v" }, "<cr>a", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<cr>i", function() vim.lsp.buf.implementation() end)

    -- Rename
    vim.keymap.set("n", "<cr>r", "<cmd>Lspsaga rename<CR>")

    vim.keymap.set("n", "<cr>d", "<cmd>Lspsaga peek_definition<CR>")

    -- Go to Definition
    vim.keymap.set("n", "<cr>t", "<cmd>Lspsaga goto_definition<CR>")

    -- Show cursor diagnostic
    -- also like show_line_diagnostics  support pass ++unfocus
    vim.keymap.set("n", "<cr>e", "<cmd>Lspsaga show_line_diagnostics<CR>")

    -- Show buffer diagnostic
    vim.keymap.set("n", "<leader>E", "<cmd>Lspsaga show_buf_diagnostics<CR>")

    -- Diagnsotic jump can use `<c-o>` to jump back
    vim.keymap.set("n", "ge", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set("n", "gE", "<cmd>Lspsaga diagnostic_jump_next<CR>")

    -- Toglle Outline
    vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

    -- Hover Doc
    -- if there has no hover will have a notify no information available
    -- to disable it just Lspsaga hover_doc ++quiet
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>")

    -- Callhierarchy
    vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

    -- Float terminal
    vim.keymap.set({ "n", "t" }, "<C-T>", "<cmd>Lspsaga term_toggle<CR>")
end

return M

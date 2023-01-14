local M = {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga"
}

M.init = function()
    vim.keymap.set("n", "<leader>s", "<cmd>Lspsaga lsp_finder<CR>")

    -- Code action
    vim.keymap.set({"n","v"}, "<cr>a", "<cmd>Lspsaga code_action<CR>")

    -- Rename
    vim.keymap.set("n", "<cr>r", "<cmd>Lspsaga rename<CR>")

    -- Peek Definition
    -- you can edit the definition file in this flaotwindow
    -- also support open/vsplit/etc operation check definition_action_keys
    -- support tagstack C-t jump back
    vim.keymap.set("n", "<cr>t", "<cmd>Lspsaga peek_definition<CR>")

    -- Go to Definition
    vim.keymap.set("n","<cr>d", "<cmd>Lspsaga goto_definition<CR>")

    -- Show line diagnostics you can pass arugment ++unfocus to make
    -- show_line_diagnsotic float window unfocus
    -- vim.keymap.set("n", "<cr>d", "<cmd>Lspsaga show_line_diagnostics<CR>")

    -- Show cursor diagnostic
    -- also like show_line_diagnostics  support pass ++unfocus
    -- vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

    -- Show buffer diagnostic
    -- vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

    -- Diagnsotic jump can use `<c-o>` to jump back
    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

    -- Diagnostic jump with filter like Only jump to error
    vim.keymap.set("n", "[E", function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    vim.keymap.set("n", "]E", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)

    -- Toglle Outline
    vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>")

    -- Hover Doc
    -- if there has no hover will have a notify no information available
    -- to disable it just Lspsaga hover_doc ++quiet
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

    -- Callhierarchy
    vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

    -- Float terminal
    vim.keymap.set({"n", "t"}, "<C-T>", "<cmd>Lspsaga term_toggle<CR>")
end

M.config = function()
    local saga = require('lspsaga')

    saga.setup({
        lightbulb = { enable = false }
    })

end

return M

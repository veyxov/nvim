return {
  "mfussenegger/nvim-dap",
  lazy = false,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio", 
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local widgets = require("dap.ui.widgets") -- Import widgets

    dapui.setup()

    -- Listeners to open UI automatically
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- Existing keymaps
    vim.keymap.set("n", "<leader>dQ", function() dap.terminate(); dap.clear_breakpoints() end, { desc = "DAP: Terminate" })
    vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Start/continue" })
    vim.keymap.set("n", "<leader>dc", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

    -- THE NEW KEYMAP FOR FLOATING WINDOW
    vim.keymap.set({"n", "v"}, "<leader>dk", function()
      widgets.hover()
    end, { desc = "DAP: Hover variable" })

  end,
}

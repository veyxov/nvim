local M = {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
        "rcarriga/nvim-dap-ui"
    }
}

M.config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = { '--interpreter=vscode' }
    }

    vim.keymap.set('n', 'ls', function() require('dap').continue() end)
    vim.keymap.set('n', 'lo', function() require('dap').step_over() end)
    vim.keymap.set('n', 'li', function() require('dap').step_into() end)
    vim.keymap.set('n', 'lO', function() require('dap').step_out() end)
    vim.keymap.set('n', 'lt', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', 'lr', function() require('dap').repl.open() end)
    vim.keymap.set('n', 'l.', function() require('dap').run_last() end)
    vim.keymap.set({ 'n', 'v' }, 'lh', function()
        require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({ 'n', 'v' }, 'lp', function()
        require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', 'lf', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', 'lS', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end)


    dap.configurations.cs = {
        {
            type = "coreclr",
            name = "launch - netcoredbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
            end,
        },
    }
end

return M

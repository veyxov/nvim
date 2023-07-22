local M = {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        {
            'mfussenegger/nvim-dap',
            keys = {
                {
                    '<leader>dd',
                    '<cmd>lua require("dap").toggle_breakpoint()<CR>',
                },
                {
                    '<leader>dn',
                    '<cmd>lua require("dap").continue()<CR>',
                },
                {
                    '<leader>do',
                    '<cmd>lua require("dap").step_over()<CR>',
                },
                {
                    '<leader>di',
                    '<cmd>lua require("dap").step_into()<CR>',
                },
            },
        },
    },
    config = function()
        local dap, dapui = require 'dap', require 'dapui'
        dapui.setup()

        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end
    end,
    keys = {
        {
            'duu',
            '<cmd>lua require("dapui").toggle()<CR>',
        },
    },
}

return M

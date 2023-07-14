local map = require('globals').Map

local M = {
    'mfussenegger/nvim-dap',
}

M.dependencies = {
    {
        'rcarriga/nvim-dap-ui',
        config = function()
            local dap, dapui = require 'dap', require 'dapui'

            dapui.setup {
                expand_lines = vim.fn.has 'nvim-0.7' == 1,
            }

            dap.listeners.after.event_initialized['dapui_config'] = function(
            )
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function(
            )
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end,
    },
}

M.keys = {
    {
        'yy',
        function() require('dap').continue() end,
    },
    {
        'yb',
        function() require('dap').toggle_breakpoint() end,
    },
}

M.config = function()
    local dap = require 'dap'

    map('yi', function() dap.step_into() end)
    map('yo', function() dap.step_over() end)
    map('yu', function() dap.step_out() end)
    map('yx', function() dap.close() end)

    local dap_status, dapui = pcall(require, 'dapui')
    if not dap_status then
        print 'dapui not loaded'
        return
    end

    -- used by nvim-dap
    dap.adapters.coreclr = {
        type = 'executable',
        command = '/usr/local/netcoredbg',
        args = { '--interpreter=vscode' },
        options = {
            detached = false, -- Will put the output in the REPL. #CloseEnough
        },
    }

    -- Neotest Test runner looks at this table
    dap.adapters.netcoredbg = vim.deepcopy(dap.adapters.coreclr)

    -- useful for debugging issues with dap
    -- Logs are written to :lua print(vim.fn.stdpath('cache'))
    -- dap.set_log_level('DEBUG')  -- or `TRACE` for more logs

    -- Used by nvim-dap
    dap.configurations.cs = {
        {
            type = 'coreclr',
            name = 'launch - netcoredbg',
            request = 'launch',
            program = function()
                return vim.fn.input(
                    'Path to dll',
                    vim.fn.getcwd() .. '/bin/Debug/',
                    'file'
                )
            end,
            -- stopAtentry = true,
            console = 'integratedTerminal',
        },
    }

    local status_ui, dap_ui = pcall(require, 'dapui')
    if not status_ui then
        print 'dapui not loaded'
        return
    end

    dap_ui.setup {
        mappings = {
            edit = 'e',
            expand = { '<CR>', '<2-LeftMouse>' },
            open = 'o',
            remove = 'd',
            repl = 'r',
            toggle = 't',
        },
    }

    -- DapUi
    dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

    vim.fn.sign_define(
        'DapBreakpoint',
        { text = '🟥', texthl = '', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
        'DapStopped',
        { text = '▶️', texthl = '', linehl = '', numhl = '' }
    )
end

return M

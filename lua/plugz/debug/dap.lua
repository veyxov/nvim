local map = require('globals').Map

local M = {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            config = function()
                local dap, dapui = require 'dap', require 'dapui'

                dapui.setup {
                    icons = {
                        expanded = '▾',
                        collapsed = '▸',
                        current_frame = '▸',
                    },
                    mappings = {
                        -- Use a table to apply multiple mappings
                        expand = { '<CR>', '<2-LeftMouse>' },
                        open = 'o',
                        remove = 'd',
                        edit = 'e',
                        repl = 'r',
                        toggle = 't',
                    },
                    -- Use this to override mappings for specific elements
                    element_mappings = {
                        -- Example:
                        -- stacks = {
                        --   open = "<CR>",
                        --   expand = "o",
                        -- }
                    },
                    -- Expand lines larger than the window
                    -- Requires >= 0.7
                    expand_lines = vim.fn.has 'nvim-0.7' == 1,
                    -- Layouts define sections of the screen to place windows.
                    -- The position can be "left", "right", "top" or "bottom".
                    -- The size specifies the height/width depending on position. It can be an Int
                    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
                    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
                    -- Elements are the elements shown in the layout (in order).
                    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
                    layouts = {
                        {
                            elements = {
                                -- Elements can be strings or table with id and size keys.
                                { id = 'scopes', size = 0.25 },
                                'breakpoints',
                                'stacks',
                                'watches',
                            },
                            size = 40, -- 40 columns
                            position = 'left',
                        },
                        {
                            elements = {
                                'repl',
                                'console',
                            },
                            size = 0.25, -- 25% of total lines
                            position = 'bottom',
                        },
                    },
                    controls = {
                        -- Requires Neovim nightly (or 0.8 when released)
                        enabled = true,
                        -- Display controls in this element
                        element = 'repl',
                        icons = {
                            pause = '',
                            play = '',
                            step_into = '',
                            step_over = '',
                            step_out = '',
                            step_back = '',
                            run_last = '↻',
                            terminate = '□',
                        },
                    },
                    floating = {
                        max_height = nil, -- These can be integers or a float between 0 and 1.
                        max_width = nil, -- Floats will be treated as percentage of your screen.
                        border = 'single', -- Border style. Can be "single", "double" or "rounded"
                        mappings = {
                            close = { 'q', '<Esc>' },
                        },
                    },
                    windows = { indent = 1 },
                    render = {
                        max_type_length = nil, -- Can be integer or nil.
                        max_value_lines = 100, -- Can be integer or nil.
                    },
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
    },
}

M.keys = {
    {
        'yy',
        function()
            require('dap').continue()
        end,
    },
    {
        'yb',
        function()
            require('dap').toggle_breakpoint()
        end,
    },
}

M.init = function()
    local dap = require 'dap'
    map('yi', function()
        dap.step_into()
    end)
    map('yo', function()
        dap.step_over()
    end)
    map('yu', function()
        dap.step_out()
    end)
    map('yx', function()
        dap.close()
    end)
end

M.config = function()
    local status, dap = pcall(require, 'dap')
    if not status then
        print 'dap not loaded'
        return
    end

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
        controls = {
            element = 'repl',
            enabled = true,
            icons = {
                disconnect = '',
                pause = '',
                play = '',
                run_last = '',
                step_back = '',
                step_into = '',
                step_out = '',
                step_over = '',
                terminate = '',
            },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = 'single',
            mappings = {
                close = { 'q', '<Esc>' },
            },
        },
        force_buffers = true,
        icons = {
            collapsed = '',
            current_frame = '',
            expanded = '',
        },
        layouts = {
            {
                elements = {
                    {
                        id = 'console',
                        size = 0.2,
                    },
                    {
                        id = 'breakpoints',
                        size = 0.2,
                    },
                    {
                        id = 'stacks',
                        size = 0.2,
                    },
                    {
                        id = 'repl',
                        size = 0.2,
                    },
                    {
                        id = 'watches',
                        size = 0.2,
                    },
                },
                position = 'left',
                size = 50,
            },
            {
                elements = {
                    {
                        id = 'scopes',
                        size = 1,
                    },
                },
                position = 'bottom',
                size = 10,
            },
        },
        mappings = {
            edit = 'e',
            expand = { '<CR>', '<2-LeftMouse>' },
            open = 'o',
            remove = 'd',
            repl = 'r',
            toggle = 't',
        },
        render = {
            indent = 1,
            max_value_lines = 100,
        },
    }

    -- DapUi
    dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
    end

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

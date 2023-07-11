return {
    'mfussenegger/nvim-dap',
    keys = {
        {
            'yy',
            '<cmd>lua require"dap".toggle_breakpoint()<CR>',
        },
        {
            'yn',
            '<cmd>lua require"dap".continue()<CR>',
            'yo',
            '<cmd>lua require"dap".step_over()<CR>',
            'yi',
            '<cmd>lua require"dap".step_into()<CR>',
        },
    },
    config = function()
        local dap = require 'dap'
        dap.adapters.coreclr = {
            type = 'executable',
            command = '/usr/local/netcoredbg',
            args = { '--interpreter=vscode' },
        }

        dap.configurations.cs = {
            {
                type = 'coreclr',
                name = 'launch - netcoredbg',
                request = 'test',
                program = function()
                    return vim.fn.input(
                        'Path to dll',
                        vim.fn.getcwd() .. '/bin/Debug/',
                        'file'
                    )
                end,
            },
        }
    end,
}

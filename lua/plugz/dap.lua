return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    { 'hs', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
    { 'hi', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
    { 'hn', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
    { 'ho', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
    { 'ht', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
    { 'hf', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' },
    { 'hd', function() require('dap.ui.widgets').hover() end, desc = 'Debug: Debug' },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      'hl',
      function() require('dapui').toggle() end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}

local Cmd = require 'globals'.Cmd
local Hydra = require("hydra")
local gitsigns = require "gitsigns"

Hydra({
	name = "Change / Resize Window",
	mode = 'n',
	body = "<C-w>",
    config = {
        hint = false -- Don't show hints
	},
	heads = {
		-- equalize window sizes
		{ "e", "<C-w>=" },
        { "s", Cmd "new" },
        { "v", Cmd "vnew" },

        -- Moving around
        { '<up>', '<C-W>k' },
        { '<down>', '<C-W>j' },
        { '<left>', '<C-W>h' },
        { '<right>', '<C-W>l' },

        -- Resizing
        { '<s-up>', '<C-w>2+' },
        { '<s-down>', '<C-w>2-' },
        { '<s-left>', '<C-w>3<' },
        { '<s-right>', '<C-w>3>' },

        { 'f', Cmd 'Telescope find_files' },

		-- close active window
		{ "q", ":q<cr>" },

		-- exit this Hydra
		{ "<Esc>", nil, { exit = true, nowait = true } },
	},
})

Hydra({
   name = 'Side scroll',
   mode = 'n',
   body = 'z',
   heads = {
      { '<left>', '5zh' },
      { '<right>', '5zl', { desc = '←/→' } },
      { '<up>', 'zH' },
      { '<down>', 'zL', { desc = 'half screen ←/→' } },
   }
})

-- Telescope 
Hydra({
    name = 'Telescope',
    mode = 'n',
    body = '<leader>f',
    config = {
        hint = false
    },
    heads = {
        { 'f', ':Telescope find_files<CR>', desc = "git managed files" },
        { 'g', ':Telescope live_grep<CR>', desc = "seach inside files" },
        { 'h', ':Telescope help_tags<CR>', desc = "seach help" },
        { 'c', ':Telescope colorscheme<CR>', desc = "choose a colorscheme" },
    }
})

Hydra({
    name = 'Debugger',
    mode = 'n',
    hint = "Debugger",
    body = '<leader>arst',
    config = {
        color = 'pink',
    },

    heads = {
        { 's', Cmd 'lua require "dap".continue()' },
        { 'n', Cmd 'lua require "dap".step_over()' },
        { 'i', Cmd 'lua require "dap".step_into()' },
        { 'o', Cmd 'lua require "dap".step_out()' },
        { 'b', Cmd 'lua require "dap".toggle_breakpoint()' },
        { 'x', Cmd 'lua require "dap".disconnect()' },
    }
})
Hydra({
   name = 'Git',
   hint = hint,
   config = {
      buffer = bufnr,
      color = 'pink',
      invoke_on_body = true,
      hint = {
         border = 'rounded'
      },
      on_enter = function()
         vim.cmd 'mkview'
         vim.cmd 'silent! %foldopen!'
         vim.bo.modifiable = false
         gitsigns.toggle_signs(true)
         gitsigns.toggle_linehl(true)
      end,
      on_exit = function()
         local cursor_pos = vim.api.nvim_win_get_cursor(0)
         vim.cmd 'loadview'
         vim.api.nvim_win_set_cursor(0, cursor_pos)
         vim.cmd 'normal zv'
         gitsigns.toggle_signs(false)
         gitsigns.toggle_linehl(false)
         gitsigns.toggle_deleted(false)
      end,
   },
   mode = {'n','x'},
   body = '<leader>g',
   heads = {
      { 'J',
         function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gitsigns.next_hunk() end)
            return '<Ignore>'
         end,
         { expr = true, desc = 'next hunk' } },
      { 'K',
         function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gitsigns.prev_hunk() end)
            return '<Ignore>'
         end,
         { expr = true, desc = 'prev hunk' } },
      { 's', ':Gitsigns stage_hunk<CR>', { silent = true, desc = 'stage hunk' } },
      { 'u', gitsigns.undo_stage_hunk, { desc = 'undo last stage' } },
      { 'S', gitsigns.stage_buffer, { desc = 'stage buffer' } },
      { 'p', gitsigns.preview_hunk, { desc = 'preview hunk' } },
      { 'd', gitsigns.toggle_deleted, { nowait = true, desc = 'toggle deleted' } },
      { 'b', gitsigns.blame_line, { desc = 'blame' } },
      { 'B', function() gitsigns.blame_line{ full = true } end, { desc = 'blame show full' } },
      { '/', gitsigns.show, { exit = true, desc = 'show base file' } }, -- show the base of the file
      { '<Enter>', '<Cmd>Neogit<CR>', { exit = true, desc = 'Neogit' } },
      { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
   }
})

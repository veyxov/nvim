local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
  },
}

function M.project_files(opts)
  opts = opts or {}
  opts.show_untracked = true
  if vim.loop.fs_stat(".git") then
    require("telescope.builtin").git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
  end
end

function M.config()
  local telescope = require("telescope")
  local borderless = true
  telescope.setup({
    extensions = {
       fzf = {
         fuzzy = true,
         override_generic_sorter = true,
         override_file_sorter = true,
       },
    },
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<C-Down>"] = require("telescope.actions").cycle_history_next,
          ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
        },
      },
      -- mappings = { i = { ["<esc>"] = actions.close } },
      -- vimgrep_arguments = {
      --   'rg',
      --   '--color=never',
      --   '--no-heading',
      --   '--with-filename',
      --   '--line-number',
      --   '--column',
      --   '--smart-case'
      -- },
      -- prompt_position = "bottom",
      prompt_prefix = " ",
      selection_caret = " ",
      -- entry_prefix = "  ",
      -- initial_mode = "insert",
      -- selection_strategy = "reset",
      -- sorting_strategy = "descending",
      -- layout_strategy = "horizontal",
      -- layout_defaults = {
      --   horizontal = {
      --     mirror = false,
      --   },
      --   vertical = {
      --     mirror = false,
      --   },
      -- },
      -- file_sorter = require"telescope.sorters".get_fzy_file
      -- file_ignore_patterns = {},
      -- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
      -- shorten_path = true,
      winblend = borderless and 0 or 10,
      -- width = 0.7,
      -- preview_cutoff = 120,
      -- results_height = 1,
      -- results_width = 0.8,
      -- border = false,
      -- color_devicons = true,
      -- use_less = true,
      -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      -- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      -- grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      -- qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

      -- -- Developer configurations: Not meant for general override
      -- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
  })

  telescope.load_extension("fzf")
end

function M.init()
	vim.keymap.set('n', '<cr>s', "<cmd>Telescope find_files<cr>") -- Fuzzy find files ****
	vim.keymap.set('n', 'hh', "<cmd>Telescope help_tags<cr>") -- Seach in help
	vim.keymap.set('n', '<cr>g', "<cmd>Telescope live_grep<cr>") -- Grep search *
	vim.keymap.set('n', '<leader>/', "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- Search in diagnostics
	vim.keymap.set('n', '<cr>r', "<cmd>Telescope lsp_references<cr>")
	vim.keymap.set('n', '<cr>d', "<cmd>Telescope diagnostics<cr>", { desc = '[S]earch [D]iagnostics' }) -- Search in diagnostics
end

return M

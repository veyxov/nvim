local M = {}

function M.setup()
  local mini_files = require 'mini.files'

  map('-', function()
    if mini_files.close() then
      return
    end

    mini_files.open()
  end)
  map('+', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end)

  mini_files.setup({
    mappings = { go_in = '<Right>', go_out = '<Left>' },
    options = { permanent_delete = false }, -- delete = move to trash, not gone forever
    windows = { preview = true, width_preview = 50 },
  })
end

return M

local M = {}

function M.setup()
  require 'mini.files'.setup {
    mappings = { go_in = '<Right>', go_out = '<Left>' },
    options = { permanent_delete = false }, -- delete = move to trash, not gone forever
    windows = { preview = true, width_preview = 50 },
  }
end

return M

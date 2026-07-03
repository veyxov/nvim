local actions = require 'diffview.actions'

-- e/i for down/up in the file panel: no hjk on this layout, and e/i mirror
-- the physical keys that give down/up on the QMK NAV layer.
require 'diffview'.setup({
  keymaps = {
    file_panel = {
      { 'n', 'e', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
      { 'n', 'i', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
      { 'n', '<cr>', actions.focus_entry, { desc = 'Open the diff and focus it' } },
    },
  },
})

map('gd', function()
  local view = require 'diffview.lib'.get_current_view()
  if view then
    vim.cmd 'DiffviewClose'
  else
    vim.cmd 'DiffviewOpen'
  end
end)

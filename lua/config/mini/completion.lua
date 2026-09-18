local M = {}

function M.setup()
  require 'mini.completion'.setup()

  -- advertise snippet + auto-import (additionalTextEdits) support to every server
  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end

return M

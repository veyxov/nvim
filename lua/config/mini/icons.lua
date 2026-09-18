local M = {}

function M.setup()
  require 'mini.icons'.setup()
  MiniIcons.mock_nvim_web_devicons()
  MiniIcons.tweak_lsp_kind() -- lsp kind icons in completion/symbols (loads vim.lsp, hence deferred)

  -- mini.basics' autocommands.basic is off (its terminal auto-insert breaks
  -- kitty-scrollback), which also drops its yank highlight; restore just that
  autocmd('TextYankPost', 'yank', { callback = function() vim.hl.on_yank() end })
end

return M

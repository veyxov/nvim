pack('mikesmithgh/kitty-scrollback.nvim', { load = false })

local loaded = false
local function load_kitty_scrollback()
  if loaded then return end
  vim.cmd.packadd 'kitty-scrollback.nvim'
  require 'kitty-scrollback'.setup()
  loaded = true
end

if vim.env.KITTY_SCROLLBACK_NVIM == 'true' then
  later(load_kitty_scrollback)
end

autocmd('CmdUndefined', 'kitty-scrollback', {
  pattern = 'KittyScrollback*',
  callback = load_kitty_scrollback,
})

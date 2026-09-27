pack('zbirenbaum/copilot.lua', { load = false })

local loaded = false
local function load_copilot()
  if loaded then return end
  vim.cmd.packadd 'copilot.lua'
  require 'copilot'.setup {
    suggestion = { auto_trigger = true, keymap = { accept = '<Right>' } },
    panel = { enabled = false },
  }
  loaded = true
end

autocmd('InsertEnter', 'copilot', { once = true, callback = load_copilot })
autocmd('CmdUndefined', 'copilot-command', {
  pattern = 'Copilot',
  callback = load_copilot,
})

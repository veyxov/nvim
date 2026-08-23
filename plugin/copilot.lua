vim.pack.add({ { src = gh('zbirenbaum/copilot.lua') } })

later(function()
  require 'copilot'.setup({
    suggestion = { auto_trigger = true, keymap = { accept = '<Right>' } },
    panel = { enabled = false },
  })
end)

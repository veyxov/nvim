vim.pack.add({ { src = gh('zbirenbaum/copilot.lua') } })

vim.schedule(function()
  require 'copilot'.setup({
    suggestion = { auto_trigger = true, keymap = { accept = '<Right>' } },
    panel = { enabled = false },
  })
end)

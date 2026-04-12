vim.pack.add({
  'https://github.com/GustavEikaas/easy-dotnet.nvim',
})

require 'easy-dotnet'.setup()

-- vim.pack.add({'https://github.com/saghen/blink.cmp'})
-- require('blink.cmp').setup({
--   keymap = {
--     preset = 'super-tab',        -- Tab to accept, very popular
--     -- preset = 'enter',         -- alternative: Enter to accept
--   },
--
--   fuzzy = {
--     implementation = "prefer_rust_with_warning",
--   },
--
--   sources = {
--     default = { "lsp", "easy-dotnet", "path", "snippets", "buffer" },
--
--     providers = {
--       ["easy-dotnet"] = {
--         name = "easy-dotnet",
--         module = "easy-dotnet.completion.blink",
--         enabled = true,
--         score_offset = 10000,   -- puts NuGet suggestions high in the list
--         async = true,
--       },
--     },
--   },
--
--   completion = {
--     documentation = { auto_show = true },
--     menu = { auto_show = true },
--   },
--
--   signature = { enabled = true },
-- })

require 'mini.completion'.setup()

local lsp = vim.lsp
map('K', function() lsp.buf.hover() end)
map('ta', function() lsp.buf.code_action() end)

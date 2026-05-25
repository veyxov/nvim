if vim.g.loaded_cs_ftplug then return end
vim.g.loaded_cs_ftplug = true

vim.pack.add({ 'https://github.com/GustavEikaas/easy-dotnet.nvim' })

require('easy-dotnet').setup({
        fsproj_mappings = false,
        picker = 'basic',
        background_scanning = true,
        notifications = { handler = false },
})
-- FIX: don't override sql injections with comment sematic tokens
vim.api.nvim_set_hl(0, '@lsp.type.string.cs', {})
vim.api.nvim_set_hl(0, '@sql.embedded.c_sharp', { link = 'CursorLine' })

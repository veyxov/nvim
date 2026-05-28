if vim.g.loaded_cs_ftplug then return end
vim.g.loaded_cs_ftplug = true

vim.pack.add({ 'https://github.com/GustavEikaas/easy-dotnet.nvim' })

require('easy-dotnet').setup({
        fsproj_mappings = false,
        picker = 'basic',
        background_scanning = true,
        notifications = { handler = false },
})

vim.lsp.config.roslyn = {
        cmd = {
                vim.fn.expand('~/.local/roslyn/content/LanguageServer/linux-x64/Microsoft.CodeAnalysis.LanguageServer'),
                '--logLevel', 'Information',
                '--extensionLogDirectory', vim.fn.stdpath('log') .. '/roslyn',
                '--stdio',
        },
        filetypes = { 'cs' },
        root_markers = { '*.sln', '*.csproj' },
}
vim.lsp.enable('roslyn')
-- FIX: don't override sql injections with comment sematic tokens
vim.api.nvim_set_hl(0, '@lsp.type.string.cs', {})
vim.api.nvim_set_hl(0, '@sql.embedded.c_sharp', { link = 'CursorLine' })

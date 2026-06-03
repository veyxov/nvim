if vim.g.loaded_cs_ftplug then return end
vim.g.loaded_cs_ftplug = true

vim.pack.add({ 'https://github.com/GustavEikaas/easy-dotnet.nvim' })

require('easy-dotnet').setup({
        fsproj_mappings = false,
        picker = 'basic',
        background_scanning = true,
        notifications = { handler = false },
        codelens = { enabled = false },
        lsp = { auto_refresh_codelens = false },
        auto_bootstrap_namespace = { type = "file_scoped", enabled = true },
})

vim.api.nvim_create_autocmd('LspAttach', {
        buffer = 0,
        callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client then
                        client.server_capabilities.codeLensProvider = nil
                end
        end,
})
vim.opt_local.foldmethod = 'indent'
vim.opt_local.foldlevel = 4

-- FIX: don't override sql injections with comment semantic tokens
vim.api.nvim_set_hl(0, '@lsp.type.string.cs', {})
vim.api.nvim_set_hl(0, '@sql.embedded.c_sharp', { link = 'CursorLine' })

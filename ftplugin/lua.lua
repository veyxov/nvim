if vim.g.loaded_lua_ftplug then return end
vim.g.loaded_lua_ftplug = true

vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
        settings = {
                Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = {
                                globals = {
                                        'vim', 'Cfg',
                                        'MiniPick', 'MiniSnippets', 'MiniCompletion', 'MiniIcons',
                                        'MiniNotify', 'MiniBufremove', 'MiniSurround', 'MiniExtra',
                                        'MiniGit', 'MiniDiff', 'MiniTrailspace', 'MiniFiles',
                                        'MiniJump2d', 'MiniPairs', 'MiniStatusline',
                                },
                        },
                        workspace = {
                                library = vim.api.nvim_get_runtime_file('', true),
                                checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                },
        },
}
vim.lsp.enable('lua_ls')

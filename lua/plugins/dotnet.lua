autocmd('FileType', 'dotnet', {
  pattern = { 'cs', 'fsharp' },
  once = true,
  callback = function()
    vim.pack.add({
      { src = gh('nvim-lua/plenary.nvim') },
      { src = gh('GustavEikaas/easy-dotnet.nvim') },
    })
    require 'easy-dotnet'.setup({
      picker = 'basic', -- mini.pick unsupported; basic avoids autodetect surprises
      test_runner = { auto_start_testrunner = false },
      lsp = {
        razor = { enabled = false }, -- no Blazor/Razor: skip html-language-server
        easy_dotnet_extension_enabled = true,
        enhanced_rename = true,         -- rename type -> rename its file too
        create_type_from_usage = true,  -- code action to generate missing types
        restart_roslyn_on_branch_change = true,
        -- Let treesitter own all highlighting: drop roslyn semantic tokens so
        -- they never override treesitter (e.g. SQL injected into C# strings).
        config = {
          on_init = function(client) client.server_capabilities.semanticTokensProvider = nil end,
        },
      },
    })

    lmap('dr', cmd 'Dotnet run')
    lmap('db', cmd 'Dotnet build')
    lmap('dt', cmd 'Dotnet test')
    lmap('dw', cmd 'Dotnet watch')
  end,
})

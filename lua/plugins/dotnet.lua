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
  end,
})

-- indent-based folding for C#: 1 fold level per 4-space step (shiftwidth=4),
-- nesting capped at 4 deep. Files open unfolded; fold on demand with za / zM.
vim.o.foldlevelstart = 99
autocmd('FileType', 'csfold', {
  pattern = 'cs',
  callback = function()
    vim.wo.foldmethod = 'indent'
    vim.wo.foldnestmax = 4
  end,
})

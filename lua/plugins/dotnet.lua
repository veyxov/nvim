local dotnet_setup_done = false
autocmd('FileType', 'dotnet', {
  pattern = { 'cs', 'fsharp' },
  callback = function(args)
    -- previews (mini.pick/fzf/telescope) set filetype=cs on scratch buffers
    -- just for highlighting; don't spawn the whole dotnet toolchain for those.
    if dotnet_setup_done or vim.bo[args.buf].buftype ~= '' then return end
    dotnet_setup_done = true
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
      },
    })
    -- easy-dotnet builds its own vim.lsp.config internally and ignores any
    -- on_init we'd pass via lsp.config, so strip semantic tokens on attach
    -- instead: let treesitter own all highlighting (e.g. SQL injected into
    -- C# strings) instead of roslyn's semantic tokens painting over it.
    autocmd('LspAttach', 'dotnet-no-semantic-tokens', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == 'easy_dotnet' then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
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

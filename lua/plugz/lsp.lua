local M = {
    'neovim/nvim-lspconfig',
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/nvim-cmp" }
}
function M.config()
    local lsp = require 'nvim-lspconfig'

    lsp.omnisharp.setup {
    cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" },

    enable_editorconfig_support = false,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = true,

    enable_import_completion = false,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    analyze_open_documents_only = false,
}
end

return M

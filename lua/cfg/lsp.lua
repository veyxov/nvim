require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
require'lspconfig'.omnisharp.setup {
    -- enable_editorconfig_support = true,
    --
    -- enable_roslyn_analyzers = true,
    --
    -- organize_imports_on_format = true,
    --
    -- enable_import_completion = true,
    --
    -- enableRoslynAnalyzers = true
}

lspconfig.sumneko_lua.setup {}
lspconfig.rust_analyzer.setup{}

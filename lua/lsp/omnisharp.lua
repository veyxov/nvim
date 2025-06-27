return {
    cmd = { "/usr/bin/omnisharp"},
    settings = {
      FormattingOptions = {
        EnableEditorConfigSupport = false,
      },
      RoslynExtensionsOptions = {
        EnableImportCompletion = true,
      },
      Sdk = {
        IncludePrereleases = true,
      },
    }
}

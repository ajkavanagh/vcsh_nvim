return {
  settings = {

    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
            reportUnknownParameterType = "warning",
            reportGeneralTypeIssues = "warning"
        }
      }
    }
  },
}

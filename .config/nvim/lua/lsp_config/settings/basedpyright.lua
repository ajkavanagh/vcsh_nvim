return {
  settings = {

    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        exclude = {
          "**/node_modules",
          "**/__pycache__",
          "**/.*",
          "**/venv",
        },
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
            reportUnknownParameterType = "warning",
            reportGeneralTypeIssues = "warning",
            reportUnusedCallResult = false,
            reportImplicitStringConcatenation = false
        }
      }
    }
  },
}

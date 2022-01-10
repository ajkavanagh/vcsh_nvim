return {
  settings = {

    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
            reportUnknownParameterType = "warning",
            reportGeneralTypeIssues = "warning"
        }
      }
    }
  },
}

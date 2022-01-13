require('lsp_config.lsp_installer')
require('lsp_config.handlers').setup()


vim.diagnostic.config({
  signs = false,    -- I find diagnostics interferes with gutter for changes
})

-- Configure rustacean with keymaps
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      local lsp_keymaps = require('lsp_config.handlers').lsp_keymaps
      lsp_keymaps(client, bufnr)
    end,
    settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        -- config from: https://neovim.discourse.group/t/cant-figure-out-how-to-get-clippy-warnings-from-rust-analyzer/4578
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        -- Add clippy lints for Rust.
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = {
            "--",
            "--no-deps",
            "-Dclippy::correctness",
            "-Dclippy::complexity",
            "-Wclippy::perf",
            "-Wclippy::pedantic",
          },
        },
      },
    },
  },
}

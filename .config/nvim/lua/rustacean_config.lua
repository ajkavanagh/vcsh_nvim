-- Configure rustacean with keymaps
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      local lsp_keymaps = require('lsp_config.handlers').lsp_keymaps
      lsp_keymaps(client, bufnr)
    end,
  },
}

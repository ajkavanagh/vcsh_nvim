local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("lsp_config.handlers").on_attach,
    capabilities = require("lsp_config.handlers").capabilities,
    flags = {
        debounce_text_changes = 300,
    }
  }

   if server.name == "jsonls" then
     local jsonls_opts = require("lsp_config.settings.jsonls")
     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
   end

   if server.name == "lua_ls" then
     local lua_ls_opts = require("lsp_config.settings.lua_ls")
     opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
   end

   if server.name == "pyright" then
     local pyright_opts = require("lsp_config.settings.pyright")
     opts = vim.tbl_deep_extend("force", pyright_opts, opts)
   end

   if server.name == "yamlls" then
     local yamlls_opts = require("lsp_config.settings.yamlls")
     opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
   end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

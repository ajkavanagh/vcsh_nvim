-- Declarative configuration of servers for Nix based configuration
--
-- The following servers are configured here.
--
--  - rnix-lsp
--  - typescript-language-server
--  - gopls
--  - pyright
--  - rust-analyzer
--  - sumneko-lua-language-server
--  - vim-language-server
--  - zls (zig)
--  - bash-language-server
--  - cmake-language-server
--  - html language-server
--
-- The handlers are in ./handlers.lua and are re-used here (and used
-- in non-declarative config).

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require("lsp_config.handlers")

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  -- flags.debounce_text_changes = 150  -- this is the default for neovim 7.0+
}


-- rnix-lsp setup -- no extra config yet.
lspconfig['rnix'].setup(vim.deepcopy(opts))


--  typescript-language-server
lspconfig['tsserver'].setup(vim.deepcopy(opts))


--  gopls
lspconfig['gopls'].setup(vim.deepcopy(opts))


--  - pyright
local pyright_opts = require("lsp_config.settings.pyright")
pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig['pyright'].setup(pyright_opts)


--  - rust-analyzer
lspconfig['rust_analyzer'].setup(vim.deepcopy(opts))


-- lua setup
local sumneko_opts = require("lsp_config.settings.sumneko_lua")
sumneko_opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
lspconfig['sumneko_lua'].setup(sumneko_opts)


--  - vim-language-server
lspconfig['vimls'].setup(vim.deepcopy(opts))


--  - zls (zig)
lspconfig['zls'].setup(vim.deepcopy(opts))


--  - bash-language-server
lspconfig['bashls'].setup(vim.deepcopy(opts))


--  - cmake-language-server
lspconfig['cmake'].setup(vim.deepcopy(opts))


--  - html language-server
lspconfig['html'].setup(vim.deepcopy(opts))

-- nodePackages.vscode-json-languageserver  # jsonls
local jsonls_opts = require("lsp_config.settings.jsonls")
jsonls_opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
lspconfig['jsonls'].setup(jsonls_opts)



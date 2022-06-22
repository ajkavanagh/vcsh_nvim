-- This configuration file needs to support both the non-declarative configuration
-- for Ubuntu (done via vcsh) and the declarative configuration for Nix/Home Manager.
--
-- The principle difference is that the lsp servers are declared in Nix expressions
-- and installed via Home Manager; i.e. they are not installed by/within Neovim
-- using any commands; they exist in the neovim space courtesy of Home Manager.
--
-- Thus, the two plugins `nlsp-settings` and `nvim-lsp-installer` are not installed
-- in the Nix version, and the configurations are declared here in
-- `lsp_config.servers` (which is not used in the non-Nix version).
-- This is slightly confusing, but does make sense, as nvim-lsp-insgtaller is
-- an installer of LSP servers, which Nix does 'for us'.


--if exists("g:not_in_nix") then
if vim.g.not_in_nix then
  -- do the non Nix, interactive, installation and configuration.
  require('lsp_config.lsp_installer')
  require('lsp_config.handlers').setup()
else
  -- do the Nix/Home Manager declaritive configuration.
  require('lsp_config.servers')
end


vim.diagnostic.config({
  signs = false,    -- I find diagnostics interferes with gutter for changes
})

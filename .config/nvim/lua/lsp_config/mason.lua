local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

mason.setup({
  -- log_level = vim.log.levels.DEBUG
})

local handlers = require("lsp_config.handlers")

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  -- flags.debounce_text_changes = 150  -- this is the default for neovim 7.0+
}

mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
    -- default handler for all servers.
    function (server_name) 
        lspconfig[server_name].setup(vim.deepcopy(opts))
    end,
    ['pyright'] = function()
        lspconfig['pyright'].setup(
        vim.tbl_deep_extend(
            "force",
            require("lsp_config.settings.pyright"),
            opts))
    end,
    ['lua_ls'] = function ()
        lspconfig['lua_ls'].setup(
        vim.tbl_deep_extend(
            "force",
            require("lsp_config.settings.lua_ls"),
            opts))
    end,
    ['jsonls'] = function ()
        lspconfig['jsonls'].setup(
        vim.tbl_deep_extend(
            "force",
            require("lsp_config.settings.jsonls"),
            opts))
    end,
    ['yamlls'] = function ()
        lspconfig['yamlls'].setup(
        vim.tbl_deep_extend(
            "force",
            require("lsp_config.settings.yamlls"),
            opts))
    end,
    -- quell:
    -- ERROR nvim-lspconfig.rust_analyzer has been setup.
    ['rust_analyzer'] = function() end,
}

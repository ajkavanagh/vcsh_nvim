local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>l", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
  vim.keymap.set( "n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float({{ border = "rounded" }, scope="line"}) end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  --- toggle inlay hints
  local function toggle_inlay_hints()
    if vim.lsp.inlay_hint.is_enabled() then
      vim.lsp.inlay_hint.enable(bufnr, false)
    else
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(bufnr, true)
      else
        print("no inlay hints available")
      end
    end
  end

  -- set the inlay keymap item
  vim.keymap.set("n", "<leader>gh", toggle_inlay_hints, opts)

end

M.lsp_keymaps = lsp_keymaps

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  lsp_keymaps(client, bufnr)
  lsp_highlight_document(client)
end

--local capabilities = vim.lsp.protocol.make_client_capabilities()

-- update capabilities if cmp_nvim_lsp plugin is installed.
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  -- capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  capabilities = cmp_nvim_lsp.default_capabilities()
end

-- M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
M.capabilities = cmp_nvim_lsp.default_capabilities()

return M

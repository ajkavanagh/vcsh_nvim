local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- This calls into the lua/lsp_config.config.lua file.
-- That file splits between Nix and non-Nix configurations.  See the
-- file for more details.
require('lsp_config.config')

-- nnoremap <leader>c :ccl<CR>
vim.api.nvim_set_keymap('n', '<Leader>ll', ':LspRestart<CR>', {noremap = true, silent = false})

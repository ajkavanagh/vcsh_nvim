local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require('lsp_config.config')

-- nnoremap <leader>c :ccl<CR>
vim.api.nvim_set_keymap('n', '<Leader>ll', ':LspRestart<CR>', {noremap = true, silent = false})

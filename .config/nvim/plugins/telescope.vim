Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'

"nnoremap <silent> <leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>
nnoremap <silent> <leader>f :Telescope find_files<cr>
nnoremap <silent> <leader><leader>g :Telescope live_grep<cr>

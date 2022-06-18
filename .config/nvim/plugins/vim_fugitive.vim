if exists("g:not_in_nix")
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'   " use :Merginal to open
endif

nnoremap <leader>gu :diffupdate<cr>
nnoremap <leader>g2 :diffget //2<cr>
nnoremap <leader>g3 :diffget //3<cr>

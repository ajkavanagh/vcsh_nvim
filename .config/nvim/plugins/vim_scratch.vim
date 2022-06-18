if exists("g:not_in_nix")
Plug 'duff/vim-scratch'
endif

" use :Scratch to get the scratch buffer
" use :Sscratch to get the scratch buffer in a split

nnoremap <leader><tab> :Scratch<cr>

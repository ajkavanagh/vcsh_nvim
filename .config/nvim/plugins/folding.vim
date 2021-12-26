Plug 'Konfekt/FastFold'
Plug 'nelstrom/vim-markdown-folding'
Plug 'kalekundert/vim-coiled-snake'      " folding support

" stop fastfold updating on save
let g:fastfold_savehook = 0
let g:fastfold_force = 1

" Folding colous
highlight Folded ctermbg=black ctermfg=grey
highlight FoldColumn ctermbg=black ctermfg=blue

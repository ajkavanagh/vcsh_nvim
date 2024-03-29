if exists("g:not_in_nix")
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
endif

" Goyo set to 79 withd
let g:goyo_width = 82
map <F8> :Goyo<cr>
noremap <Leader>gy :Goyo<cr>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

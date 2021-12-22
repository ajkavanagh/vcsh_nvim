Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Goyo set to 79 withd
let g:goyo_width = 82
map <F8> :Goyo<cr>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

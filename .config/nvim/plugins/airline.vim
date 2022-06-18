if exists("g:not_in_nix")
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 0
let g:airline_theme = 'dracula'

" Disable showing the mode in the mode-line; Airline does this for us.
set noshowmode

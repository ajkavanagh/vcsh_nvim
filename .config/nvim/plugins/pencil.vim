if exists("g:not_in_nix")
Plug 'preservim/vim-pencil'
endif

let g:pencil#joinspaces = 0      " 0=one_space (def), 1=two_spaces
let g:pencil#autoformat = 0      " 0=manual, 1=auto (def)
let g:pencil#textwidth = 79
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
augroup END

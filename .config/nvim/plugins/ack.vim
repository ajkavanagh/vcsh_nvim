if exists("g:not_in_nix")
Plug 'mileszs/ack.vim'
endif

" Configure ack.vim on Ubuntu (it's called ack-grep)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
elseif executable('ack-grep')
  let g:ackprg = 'ack-grep --nocolor'
endif

" leader-aa to start a search, leader-aw to search for the word under the
" cursor
nnoremap <leader>aa :Ack! ""<Left>
nnoremap <leader>aw :Ack! "<c-r>=expand("<cword>")<cr>"<Left>

if exists("g:not_in_nix")
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
endif

"Configure vim-python-pep8-indent
let g:pymode_indent = 0
let g:python_pep8_indent_multiline_string = 0

"Configure python-syntax
let python_highlight_all = 1


augroup python
  autocmd!
  autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
  autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
  autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
  autocmd BufWinEnter *.py setlocal number relativenumber
augroup END

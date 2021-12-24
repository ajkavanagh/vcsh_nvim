" -----------------------------------------------------------------------------
"
" augroups to control things based on filetypes
"
" -----------------------------------------------------------------------------

" file augroups
augroup files
  autocmd!
  autocmd FocusLost * :wa
augroup END


"autocmd FileType yaml
augroup yaml
  autocmd!
  autocmd BufNewFile,BufRead *.yaml set tabstop=2 softtabstop=2
    \ shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix
augroup END

"autocmd FileType json
augroup json
  autocmd!
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd BufNewFile,BufRead *.json set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=80 expandtab autoindent fileformat=unix
augroup END

augroup c
  autocmd!
  autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.c++,*.h++ set tabstop=4 softtabstop=4
    \ shiftwidth=4 expandtab autoindent fileformat=unix
augroup END

" html files
augroup html
  autocmd!
  autocmd BufNewFile,BufRead *.html,*.htm set tabstop=2 softtabstop=2
    \ shiftwidth=2 expandtab autoindent fileformat=unix
augroup END

" gitcommit files
augroup gitcommit
  autocmd!
  autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

"sh unix files -- I hate tabs
augroup sh
  autocmd!
  autocmd FileType sh set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
augroup END

" markdown files NEVER use tabs
augroup markdown
  autocmd!
  autocmd FileType sh set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=79 expandtab autoindent
augroup END

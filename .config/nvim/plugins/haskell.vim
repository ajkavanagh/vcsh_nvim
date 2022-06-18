if exists("g:not_in_nix")
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'dan-t/vim-hsimport'
Plug 'vmchale/sql-qq'     " syntax highlighting of sql within quasi-quoting.
endif


" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0

" neovimhaskell/haskell-vim:
let g:haskell_indent_if = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_let_no_in = 0

" hindent & stylish-haskell
" don't indent on save
let g:hindent_on_save = 0

" Helper function (from https://blog.jez.io/haskell-development-with-neovim/)
" To do either an hindent, a stylish or both:
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

"autocmd FileType haskell
augroup haskell
  autocmd!
  autocmd BufNewFile,BufRead *.hs set tabstop=8 softtabstop=2
    \ shiftwidth=4 textwidth=80 expandtab autoindent shiftround
    \ fileformat=unix
  "autocmd FileType haskell call SetLSPShortcuts()
augroup END

" keybindings for haskell files
augroup haskellStylish
  autocmd!
  autocmd FileType haskell nnoremap <leader>hi :Hindent<CR>
  autocmd FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  autocmd FileType haskell nnoremap <leader>hr :call HaskellFormat('both')<CR>
  autocmd FileType haskell nnoremap <leader>= :Tabularize /=<CR>
  autocmd FileType haskell nnoremap <leader>- :Tabularize /-><CR>
  autocmd FileType haskell nnoremap <leader>; :Tabularize /::<CR>
  autocmd FileType haskell nnoremap <leader>I :HsimportSymbol<CR>
  autocmd FileType haskell nnoremap <leader>M :HsimportModule<CR>
augroup END

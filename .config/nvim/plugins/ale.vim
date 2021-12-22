Plug 'dense-analysis/ale'

let g:ale_python_flake8_options = '--ignore=W503,W504,E402'  " enable binary ops at start of line

" for w0rp/ale for haskell
let g:ale_linters = {}
let g:ale_linters.haskell = ['stack-ghc-mod', 'hlint']
" Note for ghc-mod, the following is needed to install it:
" stack build ghc-mod-5.7.0.0 --resolver=lts-8.23

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'normal'

nnoremap <leader>ad :ALEDetail<cr>

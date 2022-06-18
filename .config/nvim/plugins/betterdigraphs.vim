" add some digraphs -- we have to do it early before the plugin initialises
let g:BDG_add = {
    \
    \ '::' : '∷',
    \ '=>' : '⇒',
    \}

if exists("g:not_in_nix")
Plug 'atweiden/vim-betterdigraphs'
endif

inoremap <expr> <C-K> BDG_GetDigraph()

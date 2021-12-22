" add some digraphs -- we have to do it early before the plugin initialises
let g:BDG_add = {
    \
    \ '::' : '∷',
    \ '=>' : '⇒',
    \}
Plug 'atweiden/vim-betterdigraphs'

inoremap <expr> <C-K> BDG_GetDigraph()

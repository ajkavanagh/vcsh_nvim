" themes and look'n'feel of vim
" Plug 'frankier/neovim-colors-solarized-truecolor-only'   " solarized
Plug 'dracula/vim', { 'as': 'dracula' }                  " dracula
" Plug 'zeis/vim-kolor'                                    " kolor
" Plug 'morhetz/gruvbox'                                   " read for config.
" Plug 'sickill/vim-monokai'
" Plug 'w0ng/vim-hybrid'
" Plug 'fneu/breezy'

" use 'colortheme xxx' to set it; see comments above

augroup DraculaOverrides
    autocmd!
    autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
    autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
    autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
    "autocmd User PlugLoaded ++nested colorscheme dracula
augroup end

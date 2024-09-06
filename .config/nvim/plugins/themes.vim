" themes and look'n'feel of vim
if exists("g:not_in_nix")
" Plug 'frankier/neovim-colors-solarized-truecolor-only'   " solarized
Plug 'dracula/vim', { 'as': 'dracula' }                  " dracula
" Plug 'zeis/vim-kolor'                                    " kolor
" Plug 'morhetz/gruvbox'                                   " read for config.
" Plug 'sickill/vim-monokai'
" Plug 'w0ng/vim-hybrid'
" Plug 'fneu/breezy'
" Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
endif

" set a theme
let theme = "nord"

if theme == "dracula"
    " use 'colortheme xxx' to set it; see comments above

    augroup DraculaOverrides
        autocmd!
        autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
        autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
        autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
        "autocmd User PlugLoaded ++nested colorscheme dracula
    augroup end
endif

if theme == "nord"
    " overrides for nord scheme
    "augroup nord-theme-overrides
        "autocmd!
        "" Use 'nord7' as foreground color for Vim comment titles.
        "autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
    "augroup END
endif


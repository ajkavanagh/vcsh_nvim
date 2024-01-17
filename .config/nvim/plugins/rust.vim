if exists("g:not_in_nix")
Plug 'rust-lang/rust.vim'
Plug 'mrcjkb/rustaceanvim'
endif

" also ensure we rustfmt on every save:
let g:rustfmt_autosave = 1

" Do rustacean config
lua require('rustacean_config')

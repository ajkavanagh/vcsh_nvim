if exists("g:not_in_nix")
Plug 'rust-lang/rust.vim'
endif

" also ensure we rustfmt on every save:
let g:rustfmt_autosave = 1

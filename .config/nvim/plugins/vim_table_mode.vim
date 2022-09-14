if exists("g:not_in_nix")
Plug 'dhruvasagar/vim-table-mode'
endif

let g:table_mode_header_fillchar='='
let g:table_mode_corner_corner='+'

" <leader>tt conflicts with vim-checkbox, so map it elsewhere
let g:table_mode_tableize_map = '<Leader>ti'


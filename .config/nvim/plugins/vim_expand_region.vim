if exists("g:not_in_nix")
Plug 'terryma/vim-expand-region'
endif

vnoremap v <Plug>(expand_region_expand)
vnoremap <C-v> <Plug>(expand_region_shrink)

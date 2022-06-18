if exists("g:not_in_nix")
Plug 'mhinz/vim-signify'
endif

let g:signify_vcs_list = [ 'bzr', 'git' ]
let g:signify_update_on_focusgained = 1
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'

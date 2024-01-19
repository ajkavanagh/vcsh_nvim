if exists("g:not_in_nix")
Plug 'mhinz/vim-signify'
endif

let g:signify_vcs_list = [ 'bzr', 'git' ]
let g:signify_update_on_focusgained = 1


nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)

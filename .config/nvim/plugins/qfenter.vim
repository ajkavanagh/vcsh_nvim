if exists("g:not_in_nix")
Plug 'yssl/QFEnter'
endif

let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>']
let g:qfenter_keymap.vopen = ['<Leader><CR>', '<C-v>']
let g:qfenter_keymap.hopen = ['<Leader><Space>', '<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.open = ['<Leader><Tab>', '<C-t>']


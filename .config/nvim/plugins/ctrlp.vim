if exists("g:not_in_nix")
Plug 'ctrlpvim/ctrlp.vim'
endif

"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp_root']

nnoremap <Leader>o :CtrlPCurWD<CR>
nnoremap <C-t> :CtrlPBuffer<cr>

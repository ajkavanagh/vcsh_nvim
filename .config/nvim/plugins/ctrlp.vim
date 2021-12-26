Plug 'ctrlpvim/ctrlp.vim'

"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp_root']

nnoremap <Leader>o :CtrlPCurWD<CR>
nnoremap <C-t> :CtrlPBuffer<cr>
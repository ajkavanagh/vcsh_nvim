" -----------------------------------------------------------------------------
"
" Default keymaps
"
" -----------------------------------------------------------------------------

let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"

" Useful key defs to edit and source the nvim config
" <leader>ev to edit my (n)vim RC file
nnoremap <leader>ev :tabe $MYVIMRC<cr>
" <leader>ev to source the (n)vim RC file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Bindings for terminal mode.  Let's use Crtl hjkl to leave rather than Ctrl
" + \n which is just annoying
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" Let's allow Ctrl-\ Ctrl R n be paste from the 'n' buffer.
tnoremap <expr> <C-\><C-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"Use leader <space>> to disable the search highlight until the next search
nnoremap <leader><space> :noh<CR>

"Hard-wrap paragraphs of text
noremap <leader>q gqip

"Map K to 'split' line in normal mode
:nnoremap K i<CR><Esc>

"Easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" resize splits by percentage
nnoremap <silent> <C-Up>    :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <C-Down>  :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <C-Left>  :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <C-Right> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" change splits from vert to horiz and horiz to vert
map <leader>th <C-w>t<C-W>H
map <leader>tw <C-w>t<C-W>K

" I've learnt hjkl, and now my keyboard is going to be colemak-dh, I have a
" navigation layer that uses arrows in hjkl, so let's disable the disabling of
" the arrows.
" stop using arrow keys to make me learn hjkl and use modes more
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
" make j, k do 'normal' action on wrapped lines.
nnoremap j gj
nnoremap k gk


" Reselect visual selection after indenting or outdenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position even when yanking in visual mode.
" curtesy of: https://ddrscott.github.io/blog/2016/yank-without-jank/
"vnoremap y myy`y
"vnoremap Y myY`y

" open the file even if file doesn't exist
noremap <leader>gf :e <cfile><cr>

" close the results window.
nnoremap <leader>c :ccl<CR>

" use C-n and C-p to go up and down the completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" if not windows AND we are in tmux, then use the tmux paste register
if !g:xwindows && g:tmux
  "Copy & Paste to the fakeclip & register (tmux paste)
  vmap <Leader>y "&y
  vmap <Leader>d "&d
  nmap <Leader>p "&p
  nmap <Leader>P "&P
  vmap <Leader>p "&p
  vmap <Leader>P "&P
else
  "we either have the system clipboard or a fake system clipboard
  "Copy & Paste to the system clipboard
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P
endif

" use a register in tmp to copy text between sessions (or even just store it)
vmap <Leader><Leader>y :w! /tmp/neovim.tmp<CR>
nmap <Leader><Leader>p :r! cat /tmp/neovim.tmp<CR>

nnoremap <Leader>rts :call Preserve("%s/\\s\\+$//e")<CR>


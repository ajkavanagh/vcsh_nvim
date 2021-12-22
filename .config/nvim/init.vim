"NVIM init.vim file

" -----------------------------------------------------------------------------
"
" General variable settings that can be used for configuration.
"
" -----------------------------------------------------------------------------

" Shouldn't be needed, but would be useful in the .vimrc file.
if has('nvim')
  set encoding=utf-8
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

" configure python interpreters for neovim
let g:python_host_prog = '/home/alex/.virtualenvs/py2-for-neovim/bin/python'
let g:python3_host_prog = '/home/alex/.virtualenvs/py3-for-neovim/bin/python'

"Determine what the os is and set a global.
"This will be either Linux, Darwin or Windows
if has("win64") || has("win32") || has("win16")
  let g:os = "Windows"
else
  let g:os = substitute(system('uname'), '\n', '', '')
endif

"Determine if we are running under tmux (the variable TMUX will be set)
if !empty($TMUX)
  let g:tmux = 1
else
  let g:tmux = 0
endif

"Determine if xwindows is running (i.e. for clipboard, etc.)
if !empty($DISPLAY)
  let g:xwindows = 1
else
  let g:xwindows = 0
endif


" -----------------------------------------------------------------------------
"
" General configuration settings and config for typical windows.
"
" -----------------------------------------------------------------------------

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

" we like modelines
set modeline

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in the lower right corner
set ruler

" Default editor settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

"Set the titlestring; this is for the autoswap plugin that also requires wmctrl
"to be installed in linux
set title titlestring=

" Put yanks, etc. into the * and + buffers.
set clipboard=unnamedplus

"Backups
call mkdir ('~/.config/nvim/tmp/backup', 'p')
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set backup

" Undofile is useful!
set undofile

"Show matching brackets
set showmatch

"List chars are useful
set list
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:→\ 

"Show trailing whitespace as an error.
match ErrorMsg '\s\+$'

" files to ignore in file pickers
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" Make space for messages, sign column, etc.
set cmdheight=2    " Better display for messages
set updatetime=300  " quicker update time for messages.
set shortmess+=c    " don't give |ins-completion-menu| messages
set signcolumn=yes  " Will this compete with signify??

" Syntax highlighting on.
syntax on

" See where the cursor is at all times, and remember the folds
set viewoptions=cursor,folds

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

" Disable showing the mode in the mode-line; Airline does this for us.
set noshowmode

"Set font size and type. Depends on resolution. Larger screens, prefer h20
set guifont=Menlo:h14

" spelling stuff
set spelllang=en
set spellfile=$HOME/syncthing/Config/nvim/en.utf-8.add
" use :setlocal spell to enable it for the file

"Show command in bottom right portion of the screen
set showcmd

" Sane autocompletions for the tab key in menus
set wildmenu
set wildmode=list:longest

"Show line numbers
set number
set relativenumber

" Like to see the cursor line
set cursorline

"Scrolling - I like to see a number of lines in the buffer
set scrolloff=3

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Set incremental, highlighted and case-insensitive searching
"also sane regexs (the / /\v bit)
"nnoremap / /\v
"vnoremap / /\v
set incsearch
set hlsearch
set ignorecase
set smartcase

"Hide mouse when typing
set mousehide

"Allow Cmd-C in item2
set mouse=

" where we want our splits
set splitbelow
set splitright


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

" stop using arrow keys to make me learn hjkl and use modes more
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" make j, k do 'normal' action on wrapped lines.
nnoremap j gj
nnoremap k gk


" Reselect visual selection after indenting or outdenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position even when yanking in visual mode.
" curtesy of: https://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" open the file even if file doesn't exist
:noremap <leader>gf :e <cfile><cr>

" close the results window.
nnoremap <leader>c :ccl<CR>

" use C-n and C-p to go up and down the completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" -----------------------------------------------------------------------------
"
" Plugins managed by vim-plug
"
" -----------------------------------------------------------------------------

" Automatic installation of vim-plug if it is missing
" stdpath('data') == /home/alex/.local/share/nvim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins managed by vim-plug
"Ensure you use single quotes '' for plugin names
call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/airline.vim  " airline related configuration

source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nerdcommenter.vim
source ~/.config/nvim/plugins/ctrlp.vim
source ~/.config/nvim/plugins/restore_view.vim
source ~/.config/nvim/plugins/vim_surround.vim
source ~/.config/nvim/plugins/vim_repeat.vim
source ~/.config/nvim/plugins/vim_fugitive.vim
source ~/.config/nvim/plugins/vim_unimpaired.vim
source ~/.config/nvim/plugins/vim_scratch.vim
source ~/.config/nvim/plugins/ack.vim
source ~/.config/nvim/plugins/gundo.vim
source ~/.config/nvim/plugins/rainbow_parentheses.vim
source ~/.config/nvim/plugins/folding.vim
source ~/.config/nvim/plugins/vim_peekaboo.vim

" These two are lua plugins; diffview relies on plenary; NEEDS configuring.
source ~/.config/nvim/plugins/nvim_lua_plenary.vim
source ~/.config/nvim/plugins/nvim_sindrets_diffview.vim  " needs LUA configuration at some point

source ~/.config/nvim/plugins/autoswap.vim
source ~/.config/nvim/plugins/vim_expand_region.vim
source ~/.config/nvim/plugins/easymotion.vim
source ~/.config/nvim/plugins/vim_signify.vim
source ~/.config/nvim/plugins/vim_toml.vim
source ~/.config/nvim/plugins/ansible.vim
source ~/.config/nvim/plugins/tabular.vim  " Note some au commands for Haskell
source ~/.config/nvim/plugins/pencil.vim
source ~/.config/nvim/plugins/wordy.vim
source ~/.config/nvim/plugins/zim_wiki_syntax.vim
source ~/.config/nvim/plugins/vimwiki.vim
source ~/.config/nvim/plugins/gist.vim
source ~/.config/nvim/plugins/goyo.vim
source ~/.config/nvim/plugins/betterdigraphs.vim
source ~/.config/nvim/plugins/vim_table_mode.vim
source ~/.config/nvim/plugins/markdown_composer.vim
source ~/.config/nvim/plugins/todoist.vim
source ~/.config/nvim/plugins/coc.vim     " Replace with built-in language server
source ~/.config/nvim/plugins/python.vim  " Python language support
source ~/.config/nvim/plugins/jinja2_syntax.vim
source ~/.config/nvim/plugins/rust.vim    " Rust language support
source ~/.config/nvim/plugins/haskell.vim  " Haskell language support
source ~/.config/nvim/plugins/go_lang.vim  " Go language support
source ~/.config/nvim/plugins/ale.vim      " Replace with Treesitter/LUA?
source ~/.config/nvim/plugins/vim_test.vim
source ~/.config/nvim/plugins/zeal.vim
source ~/.config/nvim/plugins/vim_css_color.vim
source ~/.config/nvim/plugins/nix.vim

source ~/.config/nvim/plugins/themes.vim   " Collections of themes

call plug#end()


"Disable code folding
set nofoldenable
"set foldmethod=indent
"set foldlevel=99
"set foldlevelstart=99


"Highlight the colour column to be textwidth+2 and 120
if v:version >= 703
  "a faint gray color, not too insistent
  highlight ColorColumn term=reverse ctermbg=233 guibg=#202020
  " put the marker(s) at 'textwidth+2' and 120
  set colorcolumn=+2,120
  " if we're called as '*view' or on a console, turn it off
  if v:progname =~? 'view' || &term =~? 'linux|console'
    set colorcolumn=
  endif
endif

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

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <Leader>rts :call Preserve("%s/\\s\\+$//e")<CR>

" file augroups
augroup files
  autocmd!
  autocmd FocusLost * :wa
augroup END


"autocmd FileType yaml
augroup yaml
  autocmd!
  autocmd BufNewFile,BufRead *.yaml set tabstop=2 softtabstop=2
    \ shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix
augroup END

"autocmd FileType json
augroup json
  autocmd!
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd BufNewFile,BufRead *.json set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=80 expandtab autoindent fileformat=unix
augroup END

augroup c
  autocmd!
  autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.c++,*.h++ set tabstop=4 softtabstop=4
    \ shiftwidth=4 expandtab autoindent fileformat=unix
augroup END

" html files
augroup html
  autocmd!
  autocmd BufNewFile,BufRead *.html,*.htm set tabstop=2 softtabstop=2
    \ shiftwidth=2 expandtab autoindent fileformat=unix
augroup END

" gitcommit files
augroup gitcommit
  autocmd!
  autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

"sh unix files -- I hate tabs
augroup sh
  autocmd!
  autocmd FileType sh set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
augroup END

" markdown files NEVER use tabs
augroup markdown
  autocmd!
  autocmd FileType sh set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=79 expandtab autoindent
augroup END


" Set the theme up
set background=dark
colorscheme dracula

" I like italicised comments
highlight Comment cterm=italic

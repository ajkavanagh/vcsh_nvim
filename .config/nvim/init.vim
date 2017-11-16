"NVIM init.vim file
"
" Shouldn't be needed, but would be useful in the .vimrc file.
if has('nvim')
  set encoding=utf-8
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"Determine what the os is and set a global.
"This will be either Linux, Darwin or Windows
if has("win64") || has("win32") || has("win16")
	let g:os = "Windows"
else
	let g:os = substitute(system('uname'), '\n', '', '')
endif

"Determine if we are running under tmux (the variable TMUX will set)
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

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in the lower right corner
set ruler

"Set the titlestring; this is for the autoswap plugin that also requires wmctrl
"to be installed in linux
set title titlestring=

"Plugins using vim-plug
call plug#begin("~/.config/nvim/plugged")

"Ensure you use single quotes '' for plugin names

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/restore_view.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'duff/vim-scratch'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'

Plug 'vim-scripts/vis'
"Disabled as they don't work properly -- try to debug sometime
"Plug 'vim-scripts/align'
"Plug 'vim-scripts/cecutil'
"Plug 'atweiden/vim-dragvisuals'

Plug 'gioele/vim-autoswap'

Plug 'terryma/vim-expand-region'
Plug 'joequery/Stupid-EasyMotion'
Plug 'mhinz/vim-signify'

" Miscelaneous plugins
Plug 'cespare/vim-toml'

" Markdown / writing support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'reedes/vim-pencil'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-notes'
Plug 'joanrivera/vim-zimwiki-syntax'
Plug 'vimwiki/vimwiki'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-wordy'
Plug 'atweiden/vim-betterdigraphs'

" Python/programming support type stuff stuff
"Plug 'majutsushi/tagbar'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'hynek/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'python-rope/ropevim'
Plug 'rust-lang/rust.vim'

" Completions using YouCompleteMe
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --gocode-completer --racer-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Rust language stuff (using the language server)
" Note that until the neovim language server is ready we use this plugin
" Plug 'autozimu/LanguageClient-neovim', {'do': ':UpdateRemotePlugins' }


" Golang stuff
Plug 'fatih/vim-go'
" We like Ctrl-T for our own mapping
let g:go_def_mapping_enabled = 0

" Rustlang stuff
Plug 'rust-lang/rust.vim'

" themes and look'n'feel of vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'goatslacker/mango.vim'
Plug 'zeis/vim-kolor'
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'w0ng/vim-hybrid'
Plug 'reedes/vim-colors-pencil'
Plug 'fneu/breezy'

call plug#end()

"Want a different map leader than \
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving - also required by vim-ctrlspace
set hidden

" Insert mode key mappings
" Ctrl-U = uppercase current work in Insert mode.
inoremap <c-u> <esc>viwUi

" This is for vim-ctrlspace
set showtabline=0
let g:CtrlSpaceDefaultMapping = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:airline_exclude_preview = 1

" airline specific stuff
set noshowmode

"Set the colour scheme.  Change this to your preference
"Here's 100's to choose from:
"http://www.vim.org/scripts/script.php?script_id=625
"colorscheme twilight

"Set font size and type. Depends on resolution. Larger screens, prefer h20
set guifont=Menlo:h14

"Tab stuff
"TODO

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

"Indent stuff
set autoindent

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

"Use leader <space>> to disable the search highlight until the next search
nnoremap <leader><space> :noh<CR>

"Hard-wrap paragraphs of text
noremap <leader>q gqi

"Enable code folding
set foldenable
"set foldmethod=indent
set foldlevel=99

" open/close folds using <space> in normal mode.
"nnoremap <space> za

" Moving text around (transposes, etc.)
" transpose chars, without moving the character position
:nnoremap <silent> gc xph
" Swap the current word with the next, without moving
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>


"Hide mouse when typing
set mousehide

"Allow Cmd-C in item2
set mouse=

"Map K to 'split' line in normal mode
:nnoremap K i<CR><Esc>

"Easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" where we want our splits
set splitbelow
set splitright

"Backups
call mkdir ($HOME . '/.config/nvim/tmp/backup', 'p')
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set backup

" Undofile is useful!
set undofile

"Show matching brackets
set showmatch

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

" if now windows AND we are in tmux, then use the tmux paste register
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

"Enter visual mode quickly.
"nmap <Leader><Leader> V

"Show trailing whitespace as an error.
match ErrorMsg '\s\+$'

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

"List chars are useful
set list
"set listchars=tab:▸\ ,eol:¬
"set listchars=tab:▸\ 
set listchars=tab:→\ 

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

" <leader>ev to edit my (n)vim RC file
nnoremap <leader>ev :tabe $MYVIMRC<cr>
" <leader>ev to source the (n)vim RC file
nnoremap <leader>sv :source $MYVIMRC<cr>

" file augroups
augroup files
  autocmd!
  autocmd FocusLost * :wa
augroup END

"autocmd FileType python
augroup python
  autocmd!
  autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
  "autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
  "autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

"autocmd FileType yaml
augroup yaml
  autocmd!
  autocmd BufNewFile,BufRead *.yaml set tabstop=2 softtabstop=2
    \ shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix
augroup END

" pencil configuration for writing
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  "autocmd FileType text         call pencil#init()
augroup END

let g:pencil#joinspaces = 1      " 0=one_space (def), 1=two_spaces
let g:pencil#autoformat = 0      " 0=manual, 1=auto (def)

" html files
augroup html
  autocmd!
  autocmd BufNewFile,BufRead *.html,*.htm set tabstop=2 softtabstop=2
    \ shiftwidth=2 expandtab autoindent fileformat=unix
augroup END


"Plugin configuration

"Better digraphs
inoremap <expr> <C-K> BDG_GetDigraph()

"dragvisuals.vim configuration
"Doesn't work properly yet!
"vmap <expr> <LEFT>   DVB_Drag('lefy')
"vmap <expr> <RIGHT>  DVB_Drag('right')
"vmap <expr> <DOWN>   DVB_Drag('down')
"vmap <expr> <UP>     DVB_Drag('up')
"vmap <expr> D        DVB_Duplicate()

"let g:DVB_TrimWS = 1

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']

"CtrlP configuration
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
nnoremap <Leader>o :CtrlPCurWD<CR>
nnoremap <C-t> :CtrlPBuffer<cr>

"vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"vim-signify
let g:signify_vcs_list = [ 'bzr', 'git' ]
let g:signify_update_on_focusgained = 1
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'


"Yggdroot/indentLine
"let g:indentLine_char = '┊'
"let g:indentLine_color_term = 234
"let g:indentLine_leadingSpaceChar = '.'
"let g:indentLine_leadingSpaceEnabled = 1

"TagBar configuration
"nnoremap <F2> :TagbarToggle<cr>

" Rainbow parenthesis configuration
nnoremap <F3> :RainbowParenthesesToggleAll<cr>

" Gundo call up configuration
nnoremap <F5> :GundoToggle<cr>

"YCM configuration
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger = 0
map <leader>gg  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>

let g:ycm_rust_src_path = '/home/alex/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" also ensure we rustfmt on every save:
let g:rustfmt_autosave = 1

"Configure vim-python-pep8-indent
let g:pymode_indent = 0

"Configure python-syntax
let python_highlight_all = 1
syntax on

"Configure python SimpylFold
let g:SimpylFold_docstring_preview=1

" Map Scratch to leader <tab> to open the scratch buffer
nnoremap <leader><tab> :Scratch<cr>

" Fugitive mappings
nnoremap <leader>gu :diffupdate<cr>
nnoremap <leader>g2 :diffget //2<cr>
nnoremap <leader>g3 :diffget //3<cr>

" Syntastic ignore empty spans, h1s, etc as common with Bootstrap
let g:syntastic_html_tidy_ignore_errors = [
  \  '<html> attribute "lang" lacks value',
  \  '<a> attribute "href" lacks value',
  \  'trimming empty <span>',
  \  'trimming empty <h1>',
  \  '<link> proprietary attribute "sizes"'
  \ ]

" Ensure that syntastic + rust play properly
let g:syntastic_rust_checkers = ['rustc']

" Configure ack.vim on Ubuntu (it's called ack-grep)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
elseif executable('ack-grep')
  let g:ackprg = 'ack-grep --nocolor'
endif

" Configure notes.vim
"let g:notes_directories = ['~/Dropbox/VimNotes']

" Configure vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/VimWiki',
    \ 'nested_syntaxes': {'python': 'python', 'rust': 'rust'}}]

" Set the theme up
set background=light
colorscheme solarized

" I like italicised comments
highlight Comment cterm=italic

" And some keyboard shortcuts to switch between the color schemes
nnoremap <leader><leader>bd :set background=dark<cr>
nnoremap <leader><leader>bl :set background=light<cr>

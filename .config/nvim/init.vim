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

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

" we like modelines
set modeline

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in the lower right corner
set ruler

"Set the titlestring; this is for the autoswap plugin that also requires wmctrl
"to be installed in linux
set title titlestring=

" add some digraphs -- we have to do it early before the plugin initialises
let g:BDG_add = {
    \
    \ '::' : '∷',
    \ '=>' : '⇒',
    \}

" Bindings for terminal mode.  Let's use Crtl hjkl to leave rather than Ctrl
" + \n which is just annoying
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" Let's allow Ctrl-\ Ctrl R n be paste from the 'n' buffer.
tnoremap <expr> <C-\><C-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" configure python interpreters for neovim
let g:python_host_prog = '/home/alex/.virtualenvs/py2-for-neovim/bin/python'
let g:python3_host_prog = '/home/alex/.virtualenvs/py3-for-neovim/bin/python'

"Plugins using vim-plug
call plug#begin("~/.config/nvim/plugged")

"Ensure you use single quotes '' for plugin names

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/restore_view.vim'

" General editing plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'duff/vim-scratch'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'godlygeek/tabular'

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


" Markdown composer plugin - building feature
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer') }

" Python/programming support
Plug 'hynek/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'davidhalter/jedi-vim'

" Rust language support
Plug 'rust-lang/rust.vim'
" Note that until the neovim language server is ready we use this plugin
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh'
  \}

" Haskell specific plugins
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'parsonsmatt/intero-neovim'
Plug 'dan-t/vim-hsimport'
Plug 'eagletmt/neco-ghc'  " used with deoplete

" Golang specific plugins
Plug 'fatih/vim-go'
" We like Ctrl-T for our own mapping
let g:go_def_mapping_enabled = 0

" General Programming support
"Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

" Deoplete plugins -- see Deoplete config for how it is configured.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Zeal - offline, searchable, programming documentation
" https://github.com/KabbAmine/zeavim.vim
Plug 'KabbAmine/zeavim.vim'

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
noremap <leader>q gqip

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

"autocmd FileType json
augroup json
  autocmd!
  autocmd BufNewFile,BufRead *.json set tabstop=4 softtabstop=4
    \ shiftwidth=4 textwidth=80 expandtab autoindent fileformat=unix
augroup END

" pencil configuration for writing
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType markdown,mkd setlocal spell
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

" gitcommit files
augroup gitcommit
  autocmd!
  autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
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


" TODO: move this to the python section
" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#force_py_version = 3

"
" Deoplete options
" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1

let g:deoplete#disable_auto_complete = 1

" Ctrl-Space to trigger deoplete manually
inoremap <silent><expr> <C-Space>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use C-n and C-p to go up and down the completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" deoplete python options
let g:deoplete#sources#jedi#show_docstring = 1

" language client options
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
    \ }

" TODO: move to a rust section
" also ensure we rustfmt on every save:
let g:rustfmt_autosave = 1

"TODO: move to a python section
"Configure vim-python-pep8-indent
let g:pymode_indent = 0

"Configure python-syntax
let python_highlight_all = 1
syntax on

"Configure python SimpylFold
let g:SimpylFold_docstring_preview=1

" Haskell related config

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0

" neovimhaskell/haskell-vim:
let g:haskell_indent_if = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_let_no_in = 0

" hindent & stylish-haskell
" don't indent on save
let g:hindent_on_save = 0

" Helper function (from https://blog.jez.io/haskell-development-with-neovim/)
" To do either an hindent, a stylish or both:
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

"autocmd FileType haskell
augroup haskell
  autocmd!
  autocmd BufNewFile,BufRead *.hs set tabstop=8 softtabstop=2
    \ shiftwidth=4 textwidth=80 expandtab autoindent shiftround
    \ fileformat=unix
augroup END

" keybindings for haskell files
augroup haskellStylish
  autocmd!
  autocmd FileType haskell nnoremap <leader>hi :Hindent<CR>
  autocmd FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  autocmd FileType haskell nnoremap <leader>hr :call HaskellFormat('both')<CR>
  autocmd FileType haskell nnoremap <leader>= :Tabularize /=<CR>
  autocmd FileType haskell nnoremap <leader>- :Tabularize /-><CR>
  autocmd FileType haskell nnoremap <leader>; :Tabularize /::<CR>
  autocmd FileType haskell nnoremap <leader>i :HsimportSymbol<CR>
  autocmd FileType haskell nnoremap <leader>m :HsimportModule<CR>
augroup END

" for w0rp/ale for haskell
let g:ale_linters = {}
let g:ale_linters.haskell = ['stack-ghc-mod', 'hlint']
" Note for ghc-mod, the following is needed to install it:
" stack build ghc-mod-5.7.0.0 --resolver=lts-8.23

" parsonsmatt/intero-neovim --- just disable it until I've got to grips with it
let g:intero_start_immediately = 0
" use ALE instead
let g:intero_use_neomake = 0


" Map Scratch to leader <tab> to open the scratch buffer
nnoremap <leader><tab> :Scratch<cr>

" Fugitive mappings
nnoremap <leader>gu :diffupdate<cr>
nnoremap <leader>g2 :diffget //2<cr>
nnoremap <leader>g3 :diffget //3<cr>

" Syntastic ignore empty spans, h1s, etc as common with Bootstrap
"let g:syntastic_html_tidy_ignore_errors = [
  "\  '<html> attribute "lang" lacks value',
  "\  '<a> attribute "href" lacks value',
  "\  'trimming empty <span>',
  "\  'trimming empty <h1>',
  "\  '<link> proprietary attribute "sizes"'
  "\ ]

"" Ensure that syntastic + rust play properly
"let g:syntastic_rust_checkers = ['rustc']

" ALE (Asynchronous Linting Engine configuration
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'normal'

" Configure ack.vim on Ubuntu (it's called ack-grep)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
elseif executable('ack-grep')
  let g:ackprg = 'ack-grep --nocolor'
endif

" leader-aa to start a search, leader-aw to search for the word under the
" cursor
nnoremap <leader>aa :Ack! ""<Left>
nnoremap <leader>aw :Ack! "<c-r>=expand("<cword>")<cr>"<Left>

" close the results window.
nnoremap <leader>c :ccl<CR>

" Configure notes.vim
"let g:notes_directories = ['~/Dropbox/VimNotes']

" Configure vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/VimWiki',
    \ 'nested_syntaxes': {'python': 'python', 'rust': 'rust'}}]
" don't shorten links at all
let g:vimwiki_url_maxsave = 0

" Set the theme up
set background=light
colorscheme solarized

" I like italicised comments
highlight Comment cterm=italic

" I want haskell to use the alternative -- always
let g:NERDAltDelims_haskell = 1

" vim-markdown-composer ... I don't like it opening the browser wing
let g:markdown_composer_browser = "google-chrome"
let g:markdown_composer_open_browser = 0

" And some keyboard shortcuts to switch between the color schemes
nnoremap <leader><leader>bd :set background=dark<cr>
nnoremap <leader><leader>bl :set background=light<cr>

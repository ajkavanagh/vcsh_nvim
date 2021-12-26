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
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
call mkdir(data_dir . '/tmp/backup', 'p')
let &backupdir = data_dir . '/tmp/backup//'
let &directory = data_dir . '/tmp/swap//'
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
set cmdheight=2     " Better display for messages
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

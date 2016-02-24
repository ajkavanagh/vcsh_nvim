".vimrc file
" copied from http://net.tutsplus.com (originally)
"

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in the lower right corner
set ruler

"Plugins using vim-plug
call plug#begin("~/.config/nvim/plugged")

"Ensure you use single quotes '' for plugin names

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'terryma/vim-expand-region'
Plug 'joequery/Stupid-EasyMotion'
Plug 'mhinz/vim-signify'
"Plug 'Yggdroot/indentLine'

Plug 'Valloric/YouCompleteMe'

" Python stuff
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'tmhedberg/SimpylFold'
Plug 'hynek/vim-python-pep8-indent'
Plug 'hdima/python-syntax'

call plug#end()

"Want a different map leader than \
let mapleader = ","
let g:mapleader = ","

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

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

"Show line numbers
set number
set relativenumber

"Scrolling - I like to see a number of lines in the buffer
set scrolloff=3

"Indent stuff
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Set incremental searching
set incsearch

"Set highlighing seaching
set hlsearch

"Use <CR> to disable the search highlight until the next search
"nnoremap <CR> :noh<CR><CR>
nnoremap <leader><CR> :noh<CR>

"case insensitive searching
set ignorecase
set smartcase

"Hide MacVim toolbar by default

"Hard-wrap paragraphs of text
noremap <leader>q gqip

"Enable code folding
set foldenable
set foldmethod=indent
set foldlevel=99

nnoremap <space> za

"Hide mouse when typing
set mousehide

"Allow Cmd-C in item2
set mouse=

"Map escape key to jk -- much, much faster
imap jj <esc>

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

"Copy & Paste to the system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

"autocmd FileType python

"Plugin configuration

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']

"CtrlP configuration
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
nnoremap <Leader>o :CtrlP<CR>

"vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"vim-signify
let g:signify_vcs_list = [ 'bzr', 'git' ]

"Yggdroot/indentLine
"let g:indentLine_char = '┊'
"let g:indentLine_color_term = 234
"let g:indentLine_leadingSpaceChar = '.'
"let g:indentLine_leadingSpaceEnabled = 1

"TagBar configuration
nnoremap <F2> :TagbarToggle<cr>

" Rainbow parenthesis configuration
nnoremap <F3> :RainbowParenthesesToggleAll<cr>

"YCM configuration
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger = 0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Configure vim-python-pep8-indent
let g:pymode_indent = 0

"Configure python-syntax
let python_highlight_all = 1

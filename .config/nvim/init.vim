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
" Setup
"
" -----------------------------------------------------------------------------
runtime ./functions.vim
runtime ./general_config.vim
runtime ./general_keymaps.vim
runtime ./load_plugins.vim
runtime ./general_augroups.vim

" -----------------------------------------------------------------------------
"
" Final config before we finish up the init.
"
" -----------------------------------------------------------------------------

" Set the theme up
set background=dark
colorscheme dracula

" I like italicised comments
"highlight Comment cterm=italic gui=italic

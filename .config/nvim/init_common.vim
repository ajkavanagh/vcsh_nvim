"NVIM init.vim file

" -----------------------------------------------------------------------------
"
" General variable settings that can be used for configuration.
"
" -----------------------------------------------------------------------------

" Shouldn't be needed, but would be useful in the .vimrc file.
if (has('nvim'))
  set encoding=utf-8
  set termguicolors
endif

" configure python interpreters for neovim
if exists("g:not_in_nix")
  let g:python_host_prog = '/home/alex/.virtualenvs/py2-for-neovim/bin/python'
  let g:python3_host_prog = '/home/alex/.virtualenvs/py3-for-neovim/bin/python'
endif

" configure the neovim-node-host if we're on nixos
"if filereadable(expand('~/.nix-profile/bin/neovim-node-host'))
  "let g:node_host_prog = expand('~/.nix-profile/bin/neovim-node-host')
"endif

"Disable providers not being used:
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0


" -----------------------------------------------------------------------------
"
" Setup
"
" -----------------------------------------------------------------------------
runtime ./vars.vim
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
highlight Comment cterm=italic gui=italic

" -----------------------------------------------------------------------------
"
" Plugins managed by vim-plug
"
" -----------------------------------------------------------------------------

" only run vim-plug if we are not running in nix
if exists("g:not_in_nix")

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

" end if exists("g:not_in_nix")
endif

runtime ./plugins/airline.vim  " airline related configuration

runtime ./plugins/nerdtree.vim
runtime ./plugins/nerdcommenter.vim

runtime ./plugins/ctrlp.vim

runtime ./plugins/qfenter.vim

runtime ./plugins/restore_view.vim
runtime ./plugins/vim_surround.vim
runtime ./plugins/vim_repeat.vim
runtime ./plugins/vim_fugitive.vim
runtime ./plugins/vim_unimpaired.vim
runtime ./plugins/vim_scratch.vim
runtime ./plugins/ack.vim
runtime ./plugins/vim-mundo.vim
runtime ./plugins/rainbow_parentheses.vim
runtime ./plugins/folding.vim
runtime ./plugins/vim_peekaboo.vim

" These two are lua plugins; diffview relies on plenary; NEEDS configuring.
runtime ./plugins/nvim_lua_plenary.vim
runtime ./plugins/nvim_sindrets_diffview.vim  " needs LUA configuration at some point
runtime ./plugins/treesitter.vim              " used by telescope
runtime ./plugins/telescope.vim
runtime ./plugins/lsp.vim                     " related plugins for native lsp work
runtime ./plugins/nvim_cmp.vim                " completion related plugins and configuration

"runtime ./plugins/autoswap.vim               " DISABLED: doesn't work with wayland
runtime ./plugins/vim_expand_region.vim
runtime ./plugins/vim_signify.vim
runtime ./plugins/vim_toml.vim
runtime ./plugins/ansible.vim
runtime ./plugins/tabular.vim  " Note some au commands for Haskell
runtime ./plugins/pencil.vim
runtime ./plugins/wordy.vim
runtime ./plugins/zim_wiki_syntax.vim

runtime ./plugins/vimwiki.vim
runtime ./plugins/taskwiki.vim

runtime ./plugins/gist.vim
runtime ./plugins/goyo.vim
runtime ./plugins/betterdigraphs.vim
runtime ./plugins/vim_table_mode.vim
runtime ./plugins/markdown_composer.vim
runtime ./plugins/vim_checkbox.vim " toggle checkboxes in markdown using <leader>tt
"runtime ./plugins/todoist.vim
runtime ./plugins/python.vim  " Python language support
runtime ./plugins/jinja2_syntax.vim
runtime ./plugins/rust.vim    " Rust language support
runtime ./plugins/haskell.vim  " Haskell language support
runtime ./plugins/go_lang.vim  " Go language support
runtime ./plugins/vim_test.vim
"runtime ./plugins/zeal.vim
runtime ./plugins/vim_css_color.vim
runtime ./plugins/nix.vim

runtime ./plugins/themes.vim   " Collections of themes

if exists("g:not_in_nix")
call plug#end()
endif

"NVIM init.vim file

" -----------------------------------------------------------------------------
"
" Import the init file that is not used on Nixos.
" 
" This init.vim file is only present on non Nix/Home Manager driven
" neovim configs.  This is because the plugins (on Nix/Home Manager) are
" managed via nix, and not through vim-plug. Therefore, to enable most
" of the configuration to be same, we need to split off the non Nix init
" file into a separate file and source it.
"
" -----------------------------------------------------------------------------

runtime ./init_not_nixos.vim

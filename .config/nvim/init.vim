"NVIM init.vim file

" -----------------------------------------------------------------------------
"
" Import the init file that is not used on Nixos.
"
" This init.vim file is only run on non Nix/Home Manager driven
" neovim configs.  This is because the plugins (on Nix/Home Manager) are
" managed via nix, and not through vim-plug. Therefore, to enable most
" of the configuration to be same, we need to be able to tell in the config
" what nvim is running on.  The g:not_in_nix global is used to control
" whether vim-plug was used.
"
" -----------------------------------------------------------------------------

let g:not_in_nix = 1

runtime ./init_common.vim

{ configs, pkgs, lib, ... }:
let
  # installs a vim plugin from git using a tag/branch
  # borrowed from https://github.com/breuerfelix/dotfiles/blob/a30c6ecd828ab102e924ca2120f2f46d9bfa847d/vim/default.nix#L4
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
  # always installs latest version
  plugin = pluginGit "HEAD";
in {

  # For neovim-nightly if it's needed to be used.
  #nixpkgs.overlays = [
  #  (import (builtins.fetchTarball {
  #    url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #  }))
  #];

  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    withNodeJs = true;
    withPython3 = true;

    # Most of the config is in vim files and in directories
    # in the submodules/vcsh_nvim/.config/nvim main config.
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./init_common.vim)
      ''
        " Extra config here?
      ''
    ];

    extraPackages = with pkgs; [
      tree-sitter
      bat ripgrep fd fzf # fzf
      nodejs
      universal-ctags

      # language servers
      # ansible-language-server # missing; may have to create
      rnix-lsp # nix language
      nodePackages.typescript nodePackages.typescript-language-server
      gopls    # golang
      nodePackages.pyright black  # python support
      rust-analyzer  # rust, obviously
      sumneko-lua-language-server  # lua
      nodePackages.vim-language-server  # vim language
      zls # zig language server
      nodePackages.vscode-json-languageserver  # jsonls
      nodePackages.bash-language-server  # bash
      cmake-language-server  # cmake
      # dot language server missing
      nodePackages.vscode-html-languageserver-bin  # html lsp
    ];

    plugins = with pkgs.vimPlugins; [
      # ./plugins/airline.vim for config
      vim-airline
      vim-airline-themes

      ctrlp-vim

      # ./plugins/nerdtree.vim for config
      nerdtree
      vim-devicons
      vim-nerdtree-syntax-highlight

      # ./plugs/nerdcommenter.vim for config
      nerdcommenter

      # Misc
      (plugin "vim-scripts/restore_view.vim")
      vim-surround
      vim-repeat

      vim-fugitive
      vim-merginal            # use :Merginal to open
      vim-unimpaired
      (plugin "duff/vim-scratch")
      ack-vim
      # (plugin "simnalamburt/vim-mundo")  # may need to do "let g:mundo_prefer_python3 = 1" early?
      vim-mundo
      rainbow_parentheses-vim
      fastfold
      (plugin "nelstrom/vim-markdown-folding")
      (plugin "kalekundert/vim-coiled-snake")      # folding support
      vim-peekaboo

      # get treesitter and telescope going
      plenary-nvim
      diffview-nvim
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-go
          tree-sitter-toml
          tree-sitter-make
          tree-sitter-json
          tree-sitter-json5
          tree-sitter-yaml
          tree-sitter-nix
          tree-sitter-cpp
          tree-sitter-rst
          tree-sitter-javascript
          tree-sitter-bash
          tree-sitter-html
          tree-sitter-vim
          tree-sitter-dot
          #tree-sitter-verilog
          tree-sitter-dockerfile
          tree-sitter-latex
          tree-sitter-jsdoc
          tree-sitter-lua
          tree-sitter-java
          tree-sitter-zig
          tree-sitter-bibtex
          tree-sitter-regex
          tree-sitter-c
          tree-sitter-cmake
          tree-sitter-rust
          tree-sitter-typescript
          tree-sitter-python
          tree-sitter-markdown
          tree-sitter-scala
          tree-sitter-css
          tree-sitter-haskell
        ]
        ))
      telescope-nvim
      telescope-fzf-native-nvim
      (plugin "nvim-telescope/telescope-media-files.nvim")
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp

      # text editing helper plugins
      vim-expand-region
      vim-easymotion
      vim-signify
      vim-toml
      ansible-vim
      tabular
      vim-pencil
      vim-wordy
      (plugin "joanrivera/vim-zimwiki-syntax")
      vimwiki
      webapi-vim
      vim-gist
      goyo-vim
      limelight-vim
      (plugin "atweiden/vim-betterdigraphs")  # may need to do a let early (before plugin?)
      vim-table-mode
      vim-markdown-composer
      (plugin "jkramer/vim-checkbox")  # toggle checkboxes in markdown using <leader>tt

      python-syntax
      vim-python-pep8-indent
      (plugin "Glench/Vim-Jinja2-Syntax")
      rust-vim
      haskell-vim
      vim-hindent
      (plugin "dan-t/vim-hsimport")
      (plugin "vmchale/sql-qq")     # syntax highlighting of sql within quasi-quoting.
      vim-go
      vim-test
      vim-css-color
      vim-nix

      dracula-vim

    ];
  };

  # We need to copy several files and directories over from
  # vcsh_nvim, but not the init.vim;
  xdg.configFile."nvim/after" = {
    source = ./after;
    recursive = true;
  };
  xdg.configFile."nvim/plugins" = {
    source = ./plugins;
    recursive = true;
  };
  xdg.configFile."nvim/lua" = {
    source = ./lua;
    recursive = true;
  };
  xdg.configFile."nvim/functions.vim".source = ./functions.vim;
  xdg.configFile."nvim/general_augroups.vim".source = ./general_augroups.vim;
  xdg.configFile."nvim/general_config.vim".source = ./general_config.vim;
  xdg.configFile."nvim/general_keymaps.vim".source = ./general_keymaps.vim;
  xdg.configFile."nvim/vars.vim".source = ./vars.vim;
  xdg.configFile."nvim/load_plugins.vim".source = ./load_plugins.vim;
}

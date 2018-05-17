#!/bin/bash
# --- ENSURE stack is installed first.
if [[ -z $(which stack) ]]; then
	echo "You need to install stack first: https://docs.haskellstack.org/en/stable/README/"
	exit 1
fi

# Install tools to support nvim coding
# from: https://blog.jez.io/haskell-development-with-neovim/
stack install hindent
stack install stylish-haskell
stack install hsimport hdevtools
# it's old and this is the latest version that seems to work.
stack build ghc-mod-5.7.0.0 --resolver=lts-8.23

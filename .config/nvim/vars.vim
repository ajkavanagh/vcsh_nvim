"NVIM vars.vim file

" -----------------------------------------------------------------------------
"
" General variable settings that can be used for configuration.
"
" -----------------------------------------------------------------------------

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

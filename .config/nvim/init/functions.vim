" -----------------------------------------------------------------------------
"
" Functions that are useful for the init file
"
" -----------------------------------------------------------------------------

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

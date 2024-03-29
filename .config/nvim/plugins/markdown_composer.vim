if exists("g:not_in_nix")
" Markdown composer plugin - building feature
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer') }
endif

" vim-markdown-composer ... I don't like it opening the browser wing
let g:markdown_composer_browser = "firefox"
let g:markdown_composer_open_browser = 0
let g:markdown_composer_autostart = 0

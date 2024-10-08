" detect if the directories for vimwiki exist.
" and only set up Vimwiki if at least one of the directories exist.
let vimwiki_list = []


if isdirectory(expand('~/Documents/VimWikiNotes'))
    let wiki_notes_md = {}
    let wiki_notes_md.name = 'home'
    let wiki_notes_md.path = "~/Documents/VimWikiNotes/notes"
    let wiki_notes_md.path_html = '~/Documents/VimWikiNotes/html'
    let wiki_notes_md.syntax = 'markdown'
    let wiki_notes_md.ext = '.md'
    let wiki_notes_md.nested_syntaxes = {'python': 'python', 'rust': 'rust',
                                      \  'haskell': 'haskell'}
    let wiki_notes_md.auto_export = 0  " set to 1 to auto generate the page on save
    let wiki_notes_md.auto_doc = 0     " set to 1 to auto redo TOC on the page.
    let wiki_notes_md.custom_wiki2html = '~/bin/vw2html'
    let wiki_notes_md.template_path = '~/Documents/VimWikiNotes/templates'
    let wiki_notes_md.template_default = 'default'
    let wiki_notes_md.template_ext = '.html'

    let wiki_notes_md.list_margin = 0  " needs to be this for markdown
    let wiki_notes_md.auto_tags = 1    " update tags metadata on save

    let vimwiki_list = vimwiki_list + [wiki_notes_md]
endif

if isdirectory(expand('~/Projects/Personal/sites/vps-sites/vimwiki-src'))
    " This is an attempt at a blog using Vimwiki markdown with pandoc and my
    " own converter.  It's an on going project.
    let wiki_sites = {}
    let wiki_sites.name = 'sites'
    let wiki_sites.path = '~/Projects/Personal/sites/vps-sites/vimwiki-src'
    let wiki_sites.path_html = '~/Projects/Personal/sites/vps-sites/vw2html-site'
    let wiki_sites.syntax = 'markdown'
    let wiki_sites.ext = '.md'
    let wiki_sites.nested_syntaxes = {'python': 'python', 'rust': 'rust',
                                  \  'haskell': 'haskell'}
    let wiki_sites.auto_export = 0  " set to 1 to auto generate the page on save
    let wiki_sites.auto_doc = 0     " set to 1 to auto redo TOC on the page.
    let wiki_sites.custom_wiki2html = '~/bin/vw2html'
    let wiki_sites.template_path = '~/Projects/Personal/sites/vps-sites/vw2html-templates'
    let wiki_sites.template_default = 'default'
    let wiki_sites.template_ext = '.html'

    let wiki_sites.list_margin = 0  " needs to be this for markdown
    let wiki_sites.auto_tags = 1    " update tags metadata on save

    let vimwiki_list = vimwiki_list + [wiki_sites]
endif

if isdirectory(expand('~/Projects/Canonical/vimwiki'))
    " ----------------------
    " Canonical related wiki
    let wiki_canonical = {}
    let wiki_canonical.name = 'canonical'
    let wiki_canonical.path = '~/Projects/Canonical/vimwiki/vimwiki-content'
    let wiki_canonical.path_html = '~/Projects/Canonical/vimwiki/vw2html-site'
    let wiki_canonical.syntax = 'markdown'
    let wiki_canonical.ext = '.md'
    let wiki_canonical.nested_syntaxes = {'python': 'python', 'rust': 'rust',
                                  \  'haskell': 'haskell'}
    let wiki_canonical.auto_export = 0  " set to 1 to auto generate the page on save
    let wiki_canonical.auto_doc = 0     " set to 1 to auto redo TOC on the page.
    let wiki_canonical.custom_wiki2html = '~/bin/vw2html'
    let wiki_canonical.template_path = '~/Projects/Canonical/vimwiki/vw2html-templates'
    let wiki_canonical.template_default = 'default'
    let wiki_canonical.template_ext = '.html'

    let wiki_canonical.list_margin = 0  " needs to be this for markdown
    let wiki_canonical.auto_tags = 1    " update tags metadata on save

    let vimwiki_list = vimwiki_list + [wiki_canonical]
endif

" Work with either lambda vimwiki on the company laptop or on the backup
if isdirectory(expand('~/Sync/vimwiki')) || isdirectory(expand('~/syncthing/lambda-sync/vimwiki'))
    if isdirectory(expand('~/syncthing/lambda-sync/vimwiki'))
        let path = '~/syncthing/lambda-sync/vimwiki'
    else
        let path = '~/Sync/vimwiki'
    endif
    " ----------------------
    " Lambda related wiki
    let wiki_lambda = {}
    let wiki_lambda.name = 'lambda'
    let wiki_lambda.path = path . '/vimwiki-content'
    let wiki_lambda.path_html = path . '/vw2html-site'
    let wiki_lambda.syntax = 'markdown'
    let wiki_lambda.ext = '.md'
    let wiki_lambda.nested_syntaxes = {'python': 'python', 'rust': 'rust',
                                  \  'haskell': 'haskell'}
    let wiki_lambda.auto_export = 0  " set to 1 to auto generate the page on save
    let wiki_lambda.auto_doc = 0     " set to 1 to auto redo TOC on the page.
    let wiki_lambda.custom_wiki2html = '~/bin/vw2html'
    let wiki_lambda.template_path = path . '/vw2html-templates'
    let wiki_lambda.template_default = 'default'
    let wiki_lambda.template_ext = '.html'

    let wiki_lambda.list_margin = 0  " needs to be this for markdown
    let wiki_lambda.auto_tags = 1    " update tags metadata on save
    let wiki_lambda.diary_frequency = 'weekly'
    let wiki_lambda.diary_start_week_day = 'monday'

    let vimwiki_list = vimwiki_list + [wiki_lambda]
endif

if len(vimwiki_list) > 0
    if exists("g:not_in_nix")
        Plug 'vimwiki/vimwiki', { 'tag': 'v2023.04.04_1' }
    endif

    augroup vimwiki
      autocmd!
      autocmd FileType vimwiki setlocal tabstop=2 softtabstop=2
        \ shiftwidth=2 expandtab autoindent shiftround
      autocmd FileType vimwiki call pencil#init({'wrap': 'hard'})
    augroup END

    " map leader <CR> to vim follow links so that we can force a follow with using taskwiki
    nnoremap <Leader><CR> :VimwikiFollowLink<CR>

    " global configuration for vimwiki

    let g:vimwiki_table_mappings=0
    let g:vimwiki_table_auto_fmt=0
    let g:vimwiki_list = vimwiki_list
    let g:vimwiki_global_ext = 0
    let g:vimwiki_ext2syntax = {}
    let g:vimwiki_markdown_link_ext = 1
    let g:vimwiki_auto_chdir = 1        " set the lcd to the vimwiki so that searching works

    " don't shorten links at all
    let g:vimwiki_url_maxsave = 0

endif

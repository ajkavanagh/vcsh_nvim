if exists("g:not_in_nix")
    Plug 'tools-life/taskwiki'
    Plug 'powerman/vim-plugin-AnsiEsc'
    "Plug 'preservim/tagbar'  - disabled as I don't use ctags
    Plug 'blindFS/vim-taskwarrior'
endif

" taskwiki config
let g:taskwiki_taskrc_location = '~/.config/task/taskrc'
let g:taskwiki_data_location = '~/.local/state/taskwarrior'
let g:taskwiki_disable_concealcursor = 'yes'


" vim-taskwarrior config:
" for vim-taskwarrior: If you experience line-wrapping issues, add the following line to your .vimrc
let g:task_rc_override = 'rc.defaultwidth=0'

" vim-taskwarrior options:
" default task report type
"let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
"let g:task_report_command  = []
" whether the field under the cursor is highlighted
"let g:task_highlight_field = 1
" can not make change to task data when set to 1
"let g:task_readonly        = 0
" vim built-in term for task undo in gvim
"let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
"let g:task_rc_override     = 'rc.defaultwidth=999'
" default fields to ask when adding a new task
"let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
"let g:task_info_vsplit     = 0
" info window size
"let g:task_info_size       = 15
" info window position
"let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
"let g:task_log_directory   = '~/.task'
" max number of historical entries
"let g:task_log_max         = '20'
" forward arrow shown on statusline
"let g:task_left_arrow      = ' <<'
" backward arrow ...
"let g:task_left_arrow      = '>> '



Plug 'janko/vim-test'

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>


" Determine the python test runner to use
if filereadable("tox.ini") && filereadable(".stestr.conf")
    let test#runners = {'Python': ['ToxWithStestr']}
    let test#python#runner = 'toxwithstestr'
elseif filereadable("pytest.ini") && filereadable("script/test")
    let test#python#runner = 'pytest'
    let test#python#pytest#executable = 'script/test'
    let test#python#pytest#file_pattern = '_test.py'
elseif filereadable(".pytest") && filereadable("Pipfile")
    let test#python#runner = 'pytest'
    let test#python#pytest#executable = 'pipenv run pytest'
    let test#python#pytest#file_pattern = '_test.py'
elseif filereadable(".pytest")
    let test#python#runner = 'pytest'
elseif filereadable(".djangotest")
    let test#python#runner = 'djangotest'
endif

" Pytest options
" NOTE: Make sure pytest-random-order is installed
let test#python#pytest#options = {
    \ 'nearest': '--capture=no -v',
    \ 'file': '--capture=no',
    \ 'suite': '--capture=no',
    \}
" Nose options
let test#python#nose#options = {
    \ 'nearest': '-v -s',
    \ 'file': '-s --randomize',
    \ 'suite': '-s --randomize',
    \}


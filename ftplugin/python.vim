" preferred indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4

set formatprg=black\ -q\ 2>/dev/null\ --stdin-filename\ %\ -

" let pyenv_python_path = split(system('pyenv which python'), '\n')[0]
" call coc#config('python', {'pythonPath': pyenv_python_path})
" call coc#config('python.venvPath', $PYENV_ROOT . '/versions/')

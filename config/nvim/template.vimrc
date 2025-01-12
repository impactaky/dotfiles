" vim
let g:my_vim_dir = '$HOME/vimfiles'

let mapleader = "'"

" clang settings
let g:my_libclang_path     = "/usr/lib/llvm-10/lib/libclang.so"
let g:my_clang_include_dir = "/usr/lib/llvm-10/include/"
let g:my_clang_option = ''
let g:my_clangd = "clangd-12"

set undodir=$HOME/vimfiles/undo

" デフォルトのmakeディレクトリ
let g:my_build_directory = './'

" let g:vimshell_interactive_encodings = {
" \}

" python3
if executable('lsb_release')
    let pyenv_dir = $HOME."/.config/nvim_".trim(system('lsb_release -rs'))
    if isdirectory(pyenv_dir)
        let g:python3_host_prog = pyenv_dir."/bin/python3"
    endif
endif

set guicursor=

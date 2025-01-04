let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
	
let g:vimshell_split_command = "vsplit"

if has('win32') || has('win64')
	" Display user name on Windows.
	let g:vimshell_prompt = $USERNAME."% "
else
	" Display user name on Linux.
	let g:vimshell_prompt = $USER."% "
endif

" Initialize execute file list.
let g:vimshell_execute_file_list = {}
" call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
" call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

autocmd FileType vimshell
	\| call vimshell#altercmd#define('ll', 'ls -l')
	\| call vimshell#altercmd#define('ls', 'ls -I"NTUSER.DAT*"')

autocmd FileType int-* call s:interactive_settings()
	function! s:interactive_settings()
endfunction

" let g:vimshell_no_default_keymappings = 1
let g:vimshell_external_history_path = expand('~/.zsh-history')


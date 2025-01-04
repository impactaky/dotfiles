let g:lightline = {
	\ 'component': {
	\   'readonly': '%{&readonly?"x":""}',
	\ },
	\ 'component_function': {
	\   'fugitive': 'LightlineFugitive',
	\   'filename': 'LightlineFilename',
	\   'fileformat': 'LightlineFileformat',
	\   'filetype': 'LightlineFiletype',
	\   'fileencoding': 'LightlineFileencoding',
	\   'mode': 'LightlineMode',
	\ },
	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	\ }

let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ]
	\ }

let g:lightline.tabline_separator = { 'left': "", 'right': "\ue0b2" }
let g:lightline.tabline_subseparator = { 'left': "١", 'right': "\ue0b2" }

function! LightlineMode()
	let fname = expand('%:t')
	return fname == '__Tagbar__' ? 'Tagbar' :
		\ fname == '__Mundo__' ? 'Mundo' :
		\ fname == '__Mundo_Preview__' ? 'Mundo Preview' :
		\ fname =~ 'NERD_tree' ? 'NERDTree' :
		\ &ft == 'unite' ? 'Unite' :
		\ &ft == 'vimfiler' ? 'VimFiler' :
		\ &ft == 'vimshell' ? 'VimShell' :
		\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineModified()
	return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
	return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
	let fname = expand('%:t')
	return
		\ fname == '__Tagbar__' ? g:lightline.fname :
		\ fname =~ '__Mundo\|NERD_tree' ? '' :
		\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
		\ &ft == 'unite' ? unite#get_status_string() :
		\ &ft == 'vimshell' ? vimshell#get_status_string() :
		\ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
		\ ('' != fname ? fname : '[No Name]') .
		\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
	try
	if expand('%:t') !~? 'Tagbar\|Mundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
		let mark = ''  " edit here for cool mark
		let branch = fugitive#head()
		return branch !=# '' ? mark.branch : ''
	endif
	catch
	endtry
	return ''
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
	return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
	let fname = expand('%:t')
	return fname == '__Tagbar__' ? 'Tagbar' :
		\ fname == '__Mundo__' ? 'Mundo' :
		\ fname == '__Mundo_Preview__' ? 'Mundo Preview' :
		\ fname =~ 'NERD_tree' ? 'NERDTree' :
		\ &ft == 'unite' ? 'Unite' :
		\ &ft == 'vimfiler' ? 'VimFiler' :
		\ &ft == 'vimshell' ? 'VimShell' :
		\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
	let g:lightline.fname = a:fname
	return lightline#statusline(0)
endfunction

" augroup AutoSyntastic
" 	autocmd!
" 	autocmd BufWritePost *.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
" 	SyntasticCheck
" 	call lightline#update()
" endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

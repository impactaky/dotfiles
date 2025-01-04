function! DeniteRename(context)
    let qflist = []
    let target = a:context['targets'][0]
    let filename = @%
    execute ":edit ".target['action__path']
    call cursor(target['action__line'], target['action__col'])
    let word = expand("<cword>")
    let name = input('Rename to : ')
    for target in a:context['targets']
        if !has_key(target, 'action__path') | continue | endif
        if !has_key(target, 'action__line') | continue | endif
        if !has_key(target, 'action__col')  | continue | endif
        execute ":edit ".target['action__path']
        let text = getline(target['action__line'])
        let text_1 = text[0:target['action__col']-2]
        let text_2 = text[target['action__col']-1:]
        let text_2 = substitute(text_2, word, name, '')
        call setline(target['action__line'], text_1.text_2)
        update
    endfor
    execute ":edit ".filename
endfunction
call denite#custom#action('file', 'rename', function('DeniteRename'))

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> t
    \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> r
    \ denite#do_map('do_action', 'rename')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select')
    nnoremap <silent><buffer><expr> a
    \ denite#do_map('toggle_select_all')
endfunction
" call denite#custom#map('insert','<Esc>','<denite:enter_mode:normal>','noremap')
" call denite#custom#map('insert','<Down>','<denite:move_to_next_line>','noremap')
" call denite#custom#map('insert','<Up>', '<denite:move_to_previous_line>','noremap')

call denite#custom#source('_', 'matchers', ['matcher_substring'])

" Ripgrep command on grep source
if executable('ripgrep')
	call denite#custom#var('grep', 'command', ['ripgrep'])
	call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
endif

" let s:denite_win_width_percent = 0.85
" let s:denite_win_height_percent = 0.4
"
" " Change denite default options
" call denite#custom#option('default', {
"     \ 'split': 'floating',
"     \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
"     \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
"     \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
"     \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
"     \ })

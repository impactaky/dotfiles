let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('zsh', 'filetypes', ['zsh', 'sh'])

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction

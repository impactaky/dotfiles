let g:asyncrun_timer = 1000

function! SetupAsyncRun()
    cclose
    execute winwidth(0) * 2 < winheight(0) * 5 ?
    \ printf("copen %d", winheight(0)/2) :
    \ printf("vertical copen %d", winwidth(0)/2)
    \ | wincmd p
endfunction

augroup vimrc
    autocmd User AsyncRunStart
                \ call SetupAsyncRun()
augroup END

" function! QuickAsyncRun()
"     if exists('g:quick_async_run_command')
"         execute(printf('AsyncRun %s', g:quick_async_run_command))
"     elseif exists('b:quick_async_run_command')
"         execute(printf('AsyncRun %s', b:quick_async_run_command))
"     else
"         execute(':QuickRun')
"     endif
" endfunction

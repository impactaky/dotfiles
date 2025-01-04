colorscheme iceberg
hi! CursorLineNr ctermbg=237 ctermfg=253 guibg=#1e2132 guifg=#cdd1e6
hi! LineNr ctermbg=235 ctermfg=239 guibg=#161821 guifg=#444b71
hi! StatusLine cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#3e445e guifg=#0f1117 term=reverse
hi! StatusLineNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#08090d
hi! TabLine cterm=NONE ctermbg=245 ctermfg=234 gui=NONE guibg=#0f1117 guifg=#444b71
hi! TabLineFill cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#08090d guifg=#08090d
hi! VertSplit cterm=NONE ctermbg=233 ctermfg=233 gui=NONE guibg=#08090d guifg=#08090d

let g:lightline.colorscheme = 'iceberg'
let col_tabfill  = ['#444b71', '#08090d', 243, 237]
let col_tabsel   = ['#c6c8d1', '#161821', 234, 245]
let p = g:lightline#colorscheme#iceberg#palette
let p.tabline.middle = [col_tabfill]
let p.tabline.left   = [col_tabfill]
let p.tabline.tabsel = [col_tabsel]

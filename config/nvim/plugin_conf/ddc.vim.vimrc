" call ddc#custom#patch_global('sources', ['nvimlsp'])
" call ddc#custom#patch_global('sourceOptions', {
"       \ '_': {
"       \   'matchers': ['matcher_head'],
"       \ },
"       \ 'nvimlsp': { 'mark': 'lsp', 'forceCompletionPattern': '\.|:|->' },
" \ })
" " Use Customized labels
" call ddc#custom#patch_global('sourceParams', {
"       \ 'nvimlsp': { 'kindLabels': { 'Class': 'c' } },
"       \ })
" call ddc#enable()

call ddc#custom#patch_global('sources', ['nvim-lsp', 'file', 'around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': { 'matchers': ['matcher_head'], 'sorters': ['sorter_rank'], 'converters': ['converter_remove_overlap'] },
      \ 'around': { 'mark': 'A' },
      \ 'file': { 'mark': 'F', 'isVolatile': v:true, 'forceCompletionPattern': '\S/\S*' },
      \ 'nvim-lsp': { 'mark': 'lsp' },
      \ 'zsh': { 'mark': 'zsh' },
      \ })
call ddc#custom#patch_global('ui', 'native')

call ddc#custom#patch_filetype(['zsh', 'sh', 'bash'], 'sources', ['zsh', 'file', 'around'])

call ddc#custom#patch_global('autoCompleteEvents', [
    \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
    \ 'CmdlineEnter', 'CmdlineChanged',
    \ ])

" Use Customized labels
call ddc#custom#patch_global('sourceParams', {
      \ })
call ddc#enable()

inoremap <C-c>   <Cmd>call pum#map#cancel()<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

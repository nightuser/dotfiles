setlocal ts=8 sw=0 sts=0
let b:neomake_open_list = 1
let g:go_asmfmt_autosave = 1
let g:go_def_reuse_buffer = 1
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mode = 'godef'
nmap <buffer> <silent> K <Plug>(go-doc-browser)
nnoremap <leader>a :cclose<CR>
nmap <buffer> <localleader>b <Plug>(go-build)
nmap <buffer> <localleader>r <Plug>(go-run)
nmap <buffer> <localleader>i <Plug>(go-info)

"set statusline+=%#goStatuslineColor#
"set statusline+=%{go#statusline#Show()}
"set statusline+=%*

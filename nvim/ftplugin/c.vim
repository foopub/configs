"prevent clashing with deoplete
" call deoplete#disable()
" 
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'clabgd',
"         \ 'cmd': {server_info->['clangd']},
"         \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
"         \ })
" endif
" 
" "vim-lsp clashes with deoplete documentation 
" setlocal completeopt-=preview
" 
" "let g:lsp_async_completion=1
" "let g:lsp_ignorecase=1
" 
" let g:deoplete#enable_at_startup = 0
" 
" nmap <buffer> gd <plug>(lsp-definition)
" nmap <buffer> <f2> <plug>(lsp-rename)
" 
" if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
" nmap <buffer> gd <plug>(lsp-definition)
" nmap <buffer> gr <plug>(lsp-references)
" nmap <buffer> gi <plug>(lsp-implementation)
" nmap <buffer> gt <plug>(lsp-type-definition)
" 
" nmap <buffer> <leader>rn <plug>(lsp-rename)
" nmap <buffer> J <plug>(lsp-code-action)
" 
" nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
" nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
" nmap <buffer> K <plug>(lsp-hover)
" nmap <buffer> ]] <plug>(lsp-document-diagnostics)

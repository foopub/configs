
"#~~~~~ deoplete ~~~~~
"
"enable
"call deoplete#enable()
"this seems to change some settings??? or no

"let g:deoplete#sources#jedi#show_docstring = 1 

set foldmethod=indent
set foldnestmax=2
set signcolumn=yes
"setlocal completeopt+=preview

"may be needed if semshi is slow 
"let g:deoplete#auto_complete_delay = 100

"autohide the window that pops up with deoplete and jedi
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"semshi settings
let g:semshi#error_sign_delay = 10

"vim-lsp clashes with deoplete documentation
let g:lsp_documentation_float=0

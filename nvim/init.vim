"Disable mouse!
set mouse=
"Dynamic search and replace
set inccommand=nosplit
set tabstop=4 shiftwidth=4 smarttab expandtab

filetype plugin indent on 
syntax enable

"#~~~~~~~~Plugins~~~~~~~~
"call plug#begin('~/.local/share/nvim/plugged')
"Plug 'neovim/nvim-lspconfig'
"Plug 'junegunn/fzf.vim'
"Plug 'norcalli/nvim-colorizer.lua'
"
""Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} unmaintained :(
"Plug 'tjdevries/nlua.nvim'
"Plug 'ziglang/zig.vim'
"Plug 'p00f/clangd_extensions.nvim'
"
"Plug 'overcache/NeoSolarized'
"call plug#end()

" auto close doc window
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

"#~~~~~~~~Appearence~~~~~~~~
set number
set signcolumn=no
setlocal spell spelllang=en_gb
set nospell

set termguicolors
colorscheme NeoSolarized


"#~~~~~~~~Completion~~~~~~~~
inoremap <C-space> <C-X><C-O>

set splitbelow
set completeopt=longest,menuone,preview

source $XDG_CONFIG_HOME/nvim/_init.lua

"Dynamic search and replace
set inccommand=nosplit

set tabstop=4 shiftwidth=4 smarttab expandtab


filetype plugin indent on 
syntax enable

"let g:python3_host_prog="/usr/bin/python3"

"use tab to navigate suggestions
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"
vnoremap # y/\V<C-R>=substitute(escape(@",'/\'),'\n','\\n','g')<CR><CR><CR>
"
vnoremap s y:%s/\V<C-R>=substitute(escape(@",'/\'),'\n','\\n','g')<CR>
"for some reason the \| gets fucked up?!?!?!?!
vnoremap H y:%s~<C-R>=substitute(escape(@", '\'), '\( \\|\n\)', '\\( \\\|\\n\\)', 'g')<CR>~[@\0@]~gc<CR>

"#~~~~~~~~Plugins~~~~~~~~
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tjdevries/nlua.nvim'
Plug 'ziglang/zig.vim'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'altercation/vim-colors-solarized'
Plug 'overcache/NeoSolarized'
Plug 'junegunn/fzf.vim'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" auto close doc window
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"#~~~~~~~~Appearence~~~~~~~~
set number
set signcolumn=no
setlocal spell spelllang=en_gb
set nospell
"colorscheme solarized
set termguicolors
colorscheme NeoSolarized

inoremap <C-space> <C-X><C-O>
noremap <C-a> <C-w>
noremap <C-w> <C-a>
noremap g<C-w> g<C-a>

set completeopt=longest,menuone

source /home/foo/.config/nvim/_init.lua

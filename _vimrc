set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'gavocanov/vim-js-indent'
Plugin 'groenewege/vim-less'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
filetype plugin on
syntax enable
set encoding=utf-8
set background=light
set nocindent
set noautoindent
set smartindent
colorscheme solarized
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set expandtab
set gdefault
set incsearch
set ignorecase
set smartcase
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set hlsearch
set backspace=indent,eol,start
let delimitMate_expand_cr=1
set nowrap
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_mruf_max = 25
let mapleader=","
map <leader>= :Tabularize /=<enter>
map <leader>: :Tabularize /:<enter>
map <leader>w <esc>:w<enter>
imap <leader>w <esc>:w<enter>
vmap <leader>w <esc>:w<enter>
map <leader>v <esc>:w<enter>:so $MYVIMRC<enter>
if has('gui_running')
  set guifont=Liberation\ Mono:h14
endif
"autocmd BufNewFile,BufRead *.less set filetype=less
"autocmd FileType less set omnifunc=csscomplete#CompleteCSS
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'gavocanov/vim-js-indent'
Plugin 'groenewege/vim-less'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
filetype plugin on
syntax enable
set background=light
set nocindent
set noautoindent
set smartindent
colorscheme solarized
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set expandtab
set gdefault
set incsearch
set ignorecase
set smartcase
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set hlsearch
set backspace=indent,eol,start
let delimitMate_expand_cr=1
set nowrap
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_mruf_max = 25
let mapleader=","
map <leader>= :Tabularize /=<enter>
map <leader>: :Tabularize /:<enter>
map <leader>w <esc>:w<enter>
imap <leader>w <esc>:w<enter>
vmap <leader>w <esc>:w<enter>
map <leader>v <esc>:w<enter>:so $MYVIMRC<enter>
if has('gui_running')
  set guifont=Liberation\ Mono:h14
endif
"autocmd BufNewFile,BufRead *.less set filetype=less
"autocmd FileType less set omnifunc=csscomplete#CompleteCSS
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

map gw <c-w><c-w>




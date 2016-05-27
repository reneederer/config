set nocompatible
filetype off

let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')

call vundle#rc(expand(vimDir . '/bundle'))
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'gavocanov/vim-js-indent'
Plugin 'groenewege/vim-less'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'xuhdev/SingleCompile'
Plugin 'eagletmt/neco-ghc'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on
syntax enable
colorscheme mayansmoke
set encoding=utf-8
set background=light
set nocindent
set noautoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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
map gr "_dawPa<space><esc>
set noswapfile
set nobackup
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
set cmdheight=2
function! SetFileTypeOptions()
    let fileExtension = fnamemodify(bufname("%"), ":e")
    imap <leader>r <esc>:wa<cr>
    map <leader>r <esc>:wa<cr>
    vmap <leader>r <esc>:wa<cr>
    if fileExtension == "hs"
        map <leader>r <esc>:wa<cr>:! ghc Main.hs && ghc Tests.hs -e Tests.main && cls && Main.exe<cr>
        imap <leader>r <esc>:wa<cr>:! ghc Main.hs && ghc Tests.hs -e Tests.main && cls && Main.exe<cr>
        vmap <leader>r <esc>:wa<cr>:! ghc Main.hs && ghc Tests.hs -e Tests.main && cls && Main.exe<cr>
    elseif fileExtension == "py"
        map <leader>r <esc>:wa<cr>:! python %<cr>
    endif
endfunction
autocmd BufNewFile,BufRead,BufEnter * :call SetFileTypeOptions()





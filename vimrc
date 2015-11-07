if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"if &encoding !=? 'utf-8' | let &termencoding = &encoding | endif
set encoding=utf-8
set fileformats=unix,mac,dos
set fileencodings=utf-8,iso-2022-jp-3,euc-jisx0213,cp932,euc-jp,sjis,jis,latin,iso-2022-jp

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'lazywei/vim-matlab'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'Shougo/neomru.vim'
call neobundle#end()

NeoBundleCheck
map <C-t> :NERDTree <enter>

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set wrapscan
set laststatus=2
set t_Co=256

map <C-g> :Gtags
map <C-f> :Gtags -f
map <C-k> :Gtags -g
map <C-i> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-t> :NERDTree <enter>

let g:lightline = {
    \ 'colorscheme' : 'solarized' ,
    \ 'component': {
	\ 'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
    \ 'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
    \ },
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
    \ }

silent! set title titlelen=100 titleold= titlestring=%f noicon iconstring=%t norightleft showtabline=1
silent! set number background=dark display=lastline,uhex wrap wrapmargin=0 guioptions=ce key

silent! syntax enable

set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

let g:vimshell_prompt = "⮀ "
let g:vimshell_secondary_prompt = "⮀ "
let g:vimshell_user_prompt = 'getcwd()'

set shellpipe=2>\&1\|/tex/bin/nkf\ -w>%s
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

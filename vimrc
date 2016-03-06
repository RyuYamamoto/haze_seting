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
NeoBundle 'geoffharcourt/one-dark.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'Flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
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
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-fugitive'
call neobundle#end()

colorscheme hybrid

NeoBundleCheck
map <C-t> :NERDTree <enter>

autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

set mouse=a
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2
set t_Co=256
set noexpandtab

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

"silent! set title titlelen=100 titleold= titlestring=%f noicon iconstring=%t norightleft showtabline=1
silent! set number background=dark display=lastline,uhex wrap wrapmargin=0 guioptions=ce key

silent! syntax enable

set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

let g:vimshell_prompt = "⮀ "
let g:vimshell_secondary_prompt = "⮀ "
let g:vimshell_user_prompt = 'getcwd()'

set shellpipe=2>\&1\|/tex/bin/nkf\ -w>%s
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

set path+=/usr/include/boost
set path+=/usr/include/eigen3
set path+=/usr/include/c++/4.8.4
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

function! RosCatkinMake()
	echo "RosCatkinMake"
	! cd ~/catkin_ws/;catkin_make
endfunction
command! RosCatkinMake :call RosCatkinMake()

function! RosTopicList()
	vnew +enew
	r! rostopic list
endfunction
command! RosTopicList :call RosTopicList()

"python setting
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10

let g:syntastic_python_checkers = ['pyflakes', 'pep8']

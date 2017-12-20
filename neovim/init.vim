" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Vim関連設定
" カラースキーム設定
colorscheme molokai
syntax on
set background=dark
let g:seiya_auto_enable=0

" タブ設定など
set mouse=a
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set laststatus=2

" Gnu globalのキーバインド
map <C-g> :Gtags
map <C-f> :Gtags -f
map <C-k> :Gtags -g
map <C-i> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
let g:gen_tags#gtags_auto_gen = 1

" Airline {{{1
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:airline_solarized_bg='dark'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_branch_prefix = '⭠'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
" /=Airline }}}1

"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"let g:airline#extensions#virtualenv#enabled = 1
"let g:airline#extensions#hunks#enabled = 0
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#ale#error_symbol = 'E:'
"let g:airline#extensions#ale#warning_symbol = 'W:'

if dein#check_install()
  call dein#install()
endif
" }}}


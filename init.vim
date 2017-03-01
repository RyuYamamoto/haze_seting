" dein.vim設定
set runtimepath^=~/.deinvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.deinvim/dein')
  call dein#begin('~/.deinvim/dein')
  call dein#load_toml('~/.deinvim/dein.toml',{'lazy' : 0})
  call dein#load_toml('~/.deinvim/dein_lazy.toml',{'lazy' : 1})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-clang')
  call dein#add('thinca/vim-quickrun')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" deoplete設定
let g:deoplete#enable_at_startup = 1

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

" vim設定
syntax on
colorscheme molokai
set nonumber
set cursorline
set cursorcolumn
set whichwrap=b,s,[,],<,>
set autoindent
set mouse=a
set smartindent
set tabstop=2
set shiftwidth=2
set showtabline=2
set softtabstop=2
set laststatus=2

if &compatible
  set nocompatible
endif

runtime! option.vim
runtime! keymap.vim
runtime! dein.vim

syntax enable
set background=dark
colorscheme solarized

set mouse=a
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2

let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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

if dein#check_install()
  call dein#install()
endif
" }}}

 " シンボルカラムを表示したままにする
let g:ale_sign_column_always = 1
" 保存時に整形してくれる
let g:ale_fix_on_save = 1
" 補完してくれる
let g:ale_completion_enabled = 1
" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
\   'c' : ['clangd'],
\   'cpp' : ['clangd']
\}
nnoremap <silent><C-w> :NERDTreeToggle<CR>

autocmd FileType cpp ClangFormatAutoEnable

let g:clang_format#style_options = {
						\ "Language" : "Cpp",
						\ "AccessModifierOffset" : -2,
						\ "AlignAfterOpenBracket" : "AlwaysBreak",
						\ "BasedOnStyle" : "Google",
						\ "BraceWrapping" : {
						\		"AfterClass" : "true",
						\		"AfterFunction" : "true",
						\		"AfterNamespace" : "true",
						\		"AfterStruct" : "true"},
						\		"BreakBeforeBraces" : "Custom",
						\		"ColumnLimit" : 100,
						\		"ConstructorInitializerIndentWidth" : 0,
						\		"ContinuationIndentWidth" : 2,
						\		"DerivePointerAlignment" : "false",
						\		"PointerAlignment" : "Middle",
						\		"ReflowComments" : "false",
            \ "Standard" : "C++11"}

" deol.nvimの設定
" 【Ctrl + o】 float windowでターミナルを表示
nnoremap <silent><C-o> :<C-u>Deol -split=floating<CR>
" 【ESC】 ターミナルモードから抜ける
"tnoremap <ESC>   <C-\><C-n>
tnoremap <C-[> <C-\><C-n>

" neotermの設定
let g:neoterm_default_mod='belowright'
let g:neoterm_size=20
let g:neoterm_autoscroll=1
tnoremap <silent> <C-w> <C-\><C-n><C-w>
let mapleader = "\<Space>"
nnoremap <c-t><c-t> :Ttoggle<CR>
tnoremap <c-t><c-t> <C-¥><C-n>:Ttoggle<CR>
"nnoremap (keymapping) :T (command)<CR>
"nnoremap (keymapping) :T (command)<CR><C-w>j
"nnoremap <Leader> :T cd %:h && cd ../build && cmake .. && make<CR><c-w>j
nnoremap <silent> <Leader>c :T catkin build<CR><C-w>j
nnoremap <silent> <Leader>m :T roscd && cd ../ && ./catkin_make_release<CR><C-w>j
"tnoremap <silent> <ESC> <C-\><C-n><C-w>
tnoremap <Esc> <C-\><C-n>

" rtagsの設定
nnoremap <silent> <F3> :call rtags#JumpTo()<CR>
nnoremap <silent> <F4> :<C-u>Unite<Space>rtags/references<CR>
nnoremap <silent> <F5> :call rtags#JumpToParent()<CR>
"noremap <leader>ri :call rtags#SymbolInfo()<CR>
noremap <Leader>j :call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap <Leader>J :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
noremap <Leader>S :call rtags#JumpTo(g:H_SPLIT)<CR>
noremap <Leader>V :call rtags#JumpTo(g:V_SPLIT)<CR>
noremap <Leader>T :call rtags#JumpTo(g:NEW_TAB)<CR>
noremap <Leader>p :call rtags#JumpToParent()<CR>
noremap <Leader>f :call rtags#FindRefs()<CR>
noremap <Leader>F :call rtags#FindRefsCallTree()<CR>
noremap <Leader>n :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rs :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rr :call rtags#ReindexFile()<CR>
noremap <Leader>rl :call rtags#ProjectList()<CR>
noremap <Leader>rw :call rtags#RenameSymbolUnderCursor()<CR>
noremap <Leader>rv :call rtags#FindVirtuals()<CR>
noremap <Leader>b :call rtags#JumpBack()<CR>
noremap <Leader>rC :call rtags#FindSuperClasses()<CR>
noremap <Leader>rc :call rtags#FindSubClasses()<CR>
noremap <Leader>rd :call rtags#Diagnostics()<CR>

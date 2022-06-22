" デフォルトでインストールするもの
let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-pyright'
    \]

" エラーと警告の色を指定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

"スペースinfoでHover
noremap <silent> <Leader>info :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
"nnoremap <silent> <Leader>df :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <C-i> :call CocAction('jumpDefinition')<CR>
"スペースfmtでFormat
nnoremap <space>fmt :call CocAction('format')<CR>
" Coc-quick-fix
nnoremap <space>fx :call CocAction('doQuickfix')<CR>

" [
"   {"text": "(e)dit", "value": "edit"}
"   {"text": "(n)ew", "value": "new"}
" ]
" NOTE: text must contains '()' to detect input and its must be 1 character
function! ChoseAction(actions) abort
  echo join(map(copy(a:actions), { _, v -> v.text }), ", ") .. ": "
  let result = getcharstr()
  let result = filter(a:actions, { _, v -> v.text =~# printf(".*\(%s\).*", result)})
  return len(result) ? result[0].value : ""
endfunction

function! CocJumpAction() abort
  let actions = [
        \ {"text": "(s)plit", "value": "split"},
        \ {"text": "(v)slit", "value": "vsplit"},
        \ {"text": "(t)ab", "value": "tabedit"},
        \ ]
  return ChoseAction(actions)
endfunction

nnoremap <silent> <C-t> :<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>

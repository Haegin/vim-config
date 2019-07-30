
" Use PCREs {{{
nnoremap / /\v
vnoremap / /\v
" }}}

" screen lines, not file lines {{{
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" }}}

" remap Q to something more useful than visual mode
map Q @q

"""" Leader config {{{
let mapleader = ','
noremap \ ,

command! ProjectFiles call fzf#run(fzf#wrap({'source': 'git ls-files -co --exclude-standard'}))

nnoremap <leader><space> :noh<CR>
nnoremap <leader>b :History<CR>
nnoremap <leader>gb :Gblame wCM<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>d :Dispatch<CR>
nnoremap <leader>p :ProjectFiles<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>u :MundoToggle<CR>
nmap <leader>nd <Plug>(coc-definition)
nmap <leader>nt <Plug>(coc-type-definition)
nmap <leader>nr <Plug>(coc-references)
" Rename - rn => rename
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
vmap <leader>rf <Plug>(coc-refactor)
nmap <leader>al <Plug>(coc-codeaction)
nmap <leader>as <Plug>(coc-codeaction-selected)
vmap <leader>as <Plug>(coc-codeaction-selected)
nmap <leader>cx <Plug>(coc-float-hide)
nnoremap <leader>co :<C-u>CocList outline<cr>
nmap <leader>ci :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
nmap <leader>f <Plug>(coc-fix-current)
nmap <leader>l <Plug>(coc-codelens-action)
" Rename - rc => rename camelCase
" noremap <leader>rc :call LanguageClient#textDocument_rename(
"             \ {'newName': Abolish.camelcase(expand('<cword>'))})<CR>
" " Rename - rs => rename snake_case
" noremap <leader>rs :call LanguageClient#textDocument_rename(
"             \ {'newName': Abolish.snakecase(expand('<cword>'))})<CR>
" " Rename - ru => rename UPPERCASE
" noremap <leader>ru :call LanguageClient#textDocument_rename(
"             \ {'newName': Abolish.uppercase(expand('<cword>'))})<CR>
nnoremap <leader>y :<C-u>CocList -A --normal yank<cr>

command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Terminal Mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
  autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg='#ffc66d' guifg=white ctermbg=1 ctermfg=15
endif


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
" Language client stuff
nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <leader>nd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>nt :call LanguageClient#textDocument_typeDefinition()<CR>
" Rename - rn => rename
noremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
" Rename - rc => rename camelCase
noremap <leader>rc :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.camelcase(expand('<cword>'))})<CR>
" Rename - rs => rename snake_case
noremap <leader>rs :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.snakecase(expand('<cword>'))})<CR>
" Rename - ru => rename UPPERCASE
noremap <leader>ru :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.uppercase(expand('<cword>'))})<CR>

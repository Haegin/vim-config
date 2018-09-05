
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

command! ProjectFiles call fzf#run(fzf#wrap({'source': 'git ls-files -com --exclude-standard'}))

nnoremap <leader><space> :noh<CR>
nnoremap <leader>b :History<CR>
nnoremap <leader>gb :Gblame wCM<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>d :Dispatch<CR>
nnoremap <leader>p :ProjectFiles<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>u :MundoToggle<CR>

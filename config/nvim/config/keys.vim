
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

nnoremap <leader><space> :noh<CR>
" nnoremap <leader>. :Unite -no-split -start-insert tag<CR>
" nnoremap <leader>a :Unite -no-split grep:.<CR>
" nnoremap <leader>b :Unite -no-split -start-insert buffer tab file_mru directory_mru<CR>
nnoremap <leader>b :History<CR>
nnoremap <Leader>ta :call RunCurrentSpecFile()<CR>
nnoremap <Leader>tn :call RunNearestSpec()<CR>
nnoremap <leader>gb :Gblame wCM<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>p :Unite -no-split -start-insert file/vcs<CR>
nnoremap <leader>p :Files<CR>
" nnoremap <leader>f :Unite -no-split -start-insert file_rec/async<CR>
nnoremap <leader>u :MundoToggle<CR>

"" Refactorings - all start with r
" Rspec Let & Subject
nnoremap <leader>rrl :RspecLet<CR>
nnoremap <leader>rrs :RspecSubject<CR>
" Hash
nnoremap <leader>rh :HashOldToNew<CR>
vnoremap <leader>rh :HashOldToNew<CR>
" }}}


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
nnoremap <leader>h :History<CR>
nnoremap <leader>gb :Git blame -wCM<CR>
if !exists('g:vscode')
  nnoremap <leader>gc <cmd>Telescope git_commits<CR>
  nnoremap <leader>gf <cmd>Telescope git_bcommits<CR>
  nnoremap <leader>gs <cmd>Telescope git_status<CR>
  nnoremap <leader>gr <cmd>Telescope git_branches<CR>
  nnoremap <leader>gt <cmd>Telescope git_stash<CR>
  " nnoremap <leader>d :Dispatch<CR>
  " nnoremap <leader>p :Files<CR>
  nnoremap <leader>p <cmd>Telescope find_files<CR>
  nnoremap <leader>/ <cmd>Telescope live_grep<CR>
  nnoremap g/ <cmd>Telescope grep_string<CR>
  nnoremap <leader>tg <cmd>Telescope git_files<CR>
  nnoremap <leader>tr <cmd>Telescope resume<CR>
  nnoremap <leader>tb <cmd>Telescope buffers<CR>
  nnoremap <leader>tc <cmd>Telescope command_history<CR>
  nnoremap <leader>tp <cmd>Telescope yank_history<CR>
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>f <cmd>lua require('telescope').extensions.fzf_writer.staged_grep()<CR>
  nnoremap <leader>u :MundoToggle<CR>
endif

nnoremap <leader>xx <cmd>Trouble<cr>
nnoremap <leader>xw <cmd>Trouble workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>Trouble document_diagnostics<cr>
nnoremap <leader>xq <cmd>Trouble quickfix<cr>
nnoremap <leader>xl <cmd>Trouble loclist<cr>
nnoremap gR <cmd>Trouble lsp_references<cr>
" Rename - rc => rename camelCase
" noremap <leader>rc :call LanguageClient#textDocument_rename(
"             \ {'newName': Abolish.camelcase(expand('<cword>'))})<CR>
" " Rename - rs => rename snake_case
" noremap <leader>rs :call LanguageClient#textDocument_rename(
"             \ {'newName': Abolish.snakecase(expand('<cword>'))})<CR>
" " Rename - ru => rename UPPERCASE
" noremap <leader>ru :call LanguageClient#textDocument_rename(
"             \ {'newName': Abolish.uppercase(expand('<cword>'))})<CR>
" nnoremap <leader>y :<C-u>CocList -A --normal yank<cr>

" command! -nargs=? Fold :call CocAction('fold', <f-args>)


" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Terminal Mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
  autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg='#ffc66d' guifg=white ctermbg=1 ctermfg=15
endif

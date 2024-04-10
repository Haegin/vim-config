
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
nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gf <cmd>Telescope git_bcommits<CR>
nnoremap <leader>gs <cmd>Telescope git_status<CR>
nnoremap <leader>gr <cmd>Telescope git_branches<CR>
nnoremap <leader>gt <cmd>Telescope git_stash<CR>
" nnoremap <leader>d :Dispatch<CR>
" nnoremap <leader>p :Files<CR>
nnoremap <leader>p <cmd>Telescope git_files<CR>
nnoremap <leader>tf <cmd>Telescope git_files<CR>
nnoremap <leader>tr <cmd>Telescope resume<CR>
nnoremap <leader>tb <cmd>Telescope buffers<CR>
nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>f <cmd>lua require('telescope').extensions.fzf_writer.staged_grep()<CR>
nnoremap <leader>u :MundoToggle<CR>
nmap <leader>nd <cmd>Telescope lsp_definitions<CR>
nmap <leader>nm <cmd>Telescope lsp_document_symbols<CR>
nmap <leader>ni <cmd>Telescope lsp_implementations<CR>
nmap <leader>nr <cmd>Telescope lsp_references<CR>
nmap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
vmap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nmap <leader>ca <cmd>Telescope lsp_code_actions<CR>
xmap <leader>= <cmd>lua vim.lsp.buf.formatting()<CR>
xmap <leader>= <cmd>lua vim.lsp.buf.formatting()<CR>

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
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

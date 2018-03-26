" Syntax {{{

"""" Configuration of plugins

" Status bar {{{
let g:lightline = {
  \ 'colorscheme': 'Dracula',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
\ }
" }}}

" FZF {{{
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}

" Neomake {{{
call neomake#configure#automake('nw', 1000)
let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_elixir_enabled_makers = ['credo']
let g:neomake_javascript_enabled_makers = ['eslint']
" }}}

" NeoFormat {{{
let g:neoformat_try_formatprg = 1
" augroup NeoformatAutoFormat
"   autocmd!
"   autocmd FileType javascript,javascript.jsx setlocal formatprg="prettier --stdin"
"   autocmd BufWritePre *.js,*.jsx Neoformat
" augroup END
" let g:neoformat_enabled_javascript = ['prettier-eslint']
" }}}

" {{{ Splitjoin
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_hanging_args = 0
" }}}

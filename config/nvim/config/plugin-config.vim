" Syntax {{{
" Check syntax on save
autocmd BufWritePost * :Neomake
" Highlight es6 files as JS files
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
" }}}

"""" Configuration of plugins

" Airline /  Status bar {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
" }}}

" FZF {{{
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--skip-vcs-ignores', {'down': '~40%'})
" }}}

" Neomake {{{
let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_elixir_enabled_makers = ['credo']
let g:neomake_javascript_enabled_makers = ['eslint']
" }}}

" NERDTree Settings {{{
let NERDTreeWinPos = 'right'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}

" Ruby tests {{{
let g:rspec_command = "Dispatch bin/rspec -f progress {spec}"
" }}}

" {{{ Splitjoin
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_hanging_args = 0
" }}}

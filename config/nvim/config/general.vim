" Indenting {{{
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set cindent
" }}}

set wildignore+=*/.git/*,*.png,*.jpg,*.svg,*.wof,*.zip,*.exe

" Space errors settings {{{
let python_space_errors = 1
let python_highlight_space_errors = 1
let c_no_tab_space_error = 1
let c_space_errors = 1
let c_no_trail_space_error = 1
let ruby_space_errors = 1
let ruby_no_trail_space_error = 1
let ruby_no_tab_space_error = 1
" }}}

" HTML Output Options {{{
let html_use_css = 1
let use_xhtml = 1
" }}}

" General stuff {{{
set wrap
set textwidth=79
set colorcolumn=80,100,115
set nu
set wildmenu
set wildmode=list:longest
set formatoptions=qrn1l
set list
set listchars=tab:▶\ ,trail:·
set hidden
set splitbelow
set splitright
set virtualedit=block
set hlsearch
set ignorecase
set smartcase
set previewheight=40 " Used for fugitive status windows among other things
set grepprg=rg\ --vimgrep
set keywordprg=:call\ <SID>show_documentation()
" }}}

" Undo files {{{
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set noswapfile
" }}}

" {{{ Statusline
" function! SL(function)
"   if exists('*'.a:function)
"     return call(a:function,[])
"   else
"     return ''
"   endif
" endfunction


" First section
execute "hi User1 guibg=" . g:terminal_color_6 . " guifg=" . g:terminal_color_0
" First divider
execute "hi User2 guibg=" . g:terminal_color_3 . " guifg=" . g:terminal_color_6
execute "hi User3 guibg=" . g:terminal_color_3 . " guifg=" . g:terminal_color_0
execute "hi User4 guibg=" . g:terminal_color_4 . " guifg=" . g:terminal_color_3
execute "hi User5 guibg=" . g:terminal_color_4 . " guifg=" . g:terminal_color_0
execute "hi User6 guibg=" . g:terminal_color_8 . " guifg=" . g:terminal_color_4
execute "hi User7 guibg=" . g:terminal_color_8 . " guifg=" . g:terminal_color_0
" 2 = green, 3 = yellow, 4 = blue, 5 = purple, 6 = dark green, 7 = light grey, 8 = dark purple, 9 = red

" set statusline=%1*%2.3n\ %2*%3*\ %{SL('fugitive#head')}\ %4*%5*\ %<%.99f\ %6*%7*\ %h%w%m%r%=%6*%5*\ %l,%c%V\ %4*%3*\ %y\ %2*%1*\ %P
" set statusline=%1*%2.3n\%{get(b:,'coc_current_function','')}\ %2*%3*\ %{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}\ %4*%5*\ %<%.99f\ %6*%7*\ %h%w%m%r%=%6*%5*\ %l,%c%V\ %4*%3*\ %y\ %2*%1*\ %P
set statusline=%1*%2.3n\ %2*%3*\ %{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}\ %4*%5*\ %<%.99f\ %6*%7*\ %h%w%m%r%=%6*%5*\ %l,%c%V\ %4*%3*\ %y\ %2*%1*\ %P
" }}}

"{{{ Tmux copy/paste
if exists('$TMUX')
  let g:clipboard = {
        \   'name': 'Yank',
        \   'copy': {
        \      '+': 'yank',
        \      '*': 'yank',
        \    },
        \   'paste': {
        \      '+': 'tmux save-buffer -',
        \      '*': 'tmux save-buffer -',
        \   },
        \   'cache_enabled': 1,
        \ }
endif
"}}}

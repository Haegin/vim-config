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
set keywordprg=:Dash
" }}}

" Undo files {{{
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set noswapfile
" }}}

" {{{ Statusline
function! SL(function)
  if exists('*'.a:function)
    return call(a:function,[])
  else
    return ''
  endif
endfunction

" First section
hi User1 guibg=#ebff87 guifg=#282936
" First divider
hi User2 guibg=#00f769 guifg=#ebff87
hi User3 guibg=#00f769 guifg=#282936
hi User4 guibg=#a1efe4 guifg=#00f769
hi User5 guibg=#a1efe4 guifg=#282936
hi User6 guibg=#62d6e8 guifg=#a1efe4
hi User7 guibg=#62d6e8 guifg=#282936

set statusline=%1*%2.3n\ %2*%3*\ %{SL('fugitive#head')}\ %4*%5*\ %<%.99f\ %6*%7*\ %h%w%m%r%=%6*%5*\ %l,%c%V\ %4*%3*\ %y\ %2*%1*\ %P
" }}}

" Python runtimes {{{
let g:python_host_prog = '/Users/harry/.pyenv/versions/neovim/bin/python'
let g:python3_host_prog = '/Users/harry/.pyenv/versions/neovim3/bin/python'
" }}}

" Indenting {{{
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set cindent
" }}}

set wildignore+=*.png,*.jpg,*.svg,*.wof,*.zip,*.exe

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
set colorcolumn=80,110
set nu
set wildmenu
set wildmode=list:longest
set formatoptions=qrn1l
set list
set listchars=tab:▶·,trail:·
set hidden
set splitbelow
set splitright
set virtualedit=block
set hlsearch
set ignorecase
set smartcase
" }}}

" Undo files {{{
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set noswapfile
" }}}

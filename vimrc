filetype off

call plug#begin('~/.vim/bundle')

"""" Bundles {{{
" tpope's plugins {{{
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
" }}}

" other authors {{{
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'hwartig/vim-seeing-is-believing'
Plug 'kien/ctrlp.vim'
Plug 'mamut/vim-css-hex'
Plug 'mhinz/vim-signify'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'sjl/gundo.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'mxw/vim-jsx'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'godlygeek/tabular'
" }}}

" colorschemes {{{
Plug 'vim-scripts/candy.vim'
Plug 'vim-scripts/molokai'
" }}}

call plug#end()

" End of Bundles }}}

filetype plugin indent on
syntax on

" Undo files and swapfiles {{{
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
  set noswapfile
endif
" }}}

"""" Configuration of plugins

set wildignore+=*.png,*.jpg,*.svg,*.wof,*.zip,*.exe

" Airline /  Status bar {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
" }}}

" Ag {{{
let g:agprg="pt --nogroup"
let g:agformat="%f:%l:%m"
" }}}

" Ctrl P {{{
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30'
" " Multiple VCS's, don't include untracked files
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard | grep -v vendor/'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': "find %s -type f -not -name '.*' -not -path '*.git/*' -not -path '*tmp/*' -not -path '*log/*' -print"
  \ }
" }}}

" NERDTree Settings {{{
let NERDTreeWinPos = 'right'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}

" Configure colour scheme {{{
set background=dark
let g:solarized_termcolors=256
" let base16colorspace=256 " must be before colorscheme declaration
colorscheme solarized
"colorscheme base16-solarized
" }}}

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

" Undo files {{{
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" }}}

"""" Leader config {{{

let mapleader = ','
noremap \ ,

nnoremap <leader><space> :noh<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :Dispatch<CR>
nnoremap <leader>f :CtrlPMRU<CR>
nnoremap <leader>gb :Gblame wCM<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>m :CtrlPBufTag<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>r :retab<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
" Clear trailing whitespace
nnoremap <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>xm <Plug>(seeing-is-believing-mark)
nmap <leader>xr <Plug>(seeing-is-believing-run)
nnoremap <F2> :set paste!<CR>
" }}}

"""" Custom commands {{{
command! -range HashOldToNew <line1>,<line2>s/\v:([A-z_?]+) ( *)\=\>/\1:\2/g
command! -range HashNewToOld <line1>,<line2>s/\v([A-z_?]+):( *) /:\1 \2=> /g

command! -range ReplaceQuotes <line1>,<line2>s/\v'([^']+)'/"\1"/g
" }}}

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

"""" Bundles {{{
" tpope's plugins {{{
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-repeat'
" }}}

" other authors {{{
Bundle 'chriskempson/base16-vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mhinz/vim-signify'
Bundle 'chrisbra/csv.vim'
" }}}

" End of Bundles }}}

filetype plugin indent on
syntax on

"""" Configuration of plugins

" Airline /  Status bar {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
" }}}

" Ctrl P {{{
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 10000
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$\|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
" Multiple VCS's, don't include untracked files
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
  \ }
" }}}

" Syntastic {{{
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_check_on_open=1
" }}}

" Buffergator settings {{{
" don't make the window wider. it's my window. I choose the size of it!
let g:buffergator_autoexpand_on_split = 0
" the buffer explorer appears on the right
let g:buffergator_viewport_split_policy = "r"
" }}}

" NERDTree Settings {{{
let g:treeExplVertical = 1
let g:treeExplDirSort = 1
let g:treeExplWinSize = 33
let NERDTreeShowBookmarks = 1
" }}}

" Configure colour scheme {{{
set background=dark
let base16colorspace=256 " must be before colorscheme declaration
colorscheme base16-solarized
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
set colorcolumn=80,120
set nu
set wildmenu
set wildmode=list:longest
set formatoptions=qrn1l
set list
set listchars=tab:▶·,trail:·
set hidden
" }}}

" Use PCREs {{{
nnoremap / /\v
vnoremap / /\v
" }}}

" screen lines, not file lines {{{
nnoremap j gj
nnoremap k gk
" }}}

"""" Leader config {{{

let mapleader = ','
noremap \ ,

nnoremap <leader>r :retab<CR>
" Clear trailing whitespace
nnoremap <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>gb :Gblame wCM<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>a :Ack 
nnoremap <leader>b :BuffergatorToggle<CR>
nnoremap <leader>n :NERDTreeToggle<cr>
" }}}

filetype off

call plug#begin('~/.config/nvim/bundle')

"""" Bundles {{{
" tpope's plugins {{{
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-dispatch'
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
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'hwartig/vim-seeing-is-believing'
Plug 'mamut/vim-css-hex'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'simnalamburt/vim-mundo'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tsukkee/unite-tag'
Plug 'm2mdas/unite-file-vcs'
Plug 'bronson/vim-visual-star-search'
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kien/ctrlp.vim'
" }}}

" Syntax highlighting {{{
Plug 'rodjek/vim-puppet'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'mxw/vim-jsx'
Plug 'wellbredgrapefruit/tomdoc.vim'
" }}}

" neovim specific plugins {{{
Plug 'floobits/floobits-neovim'
Plug 'benekastah/neomake'
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
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile
set noswapfile
" }}}

" Syntax {{{
" Check syntax on save
autocmd BufWritePost * :Neomake
" Highlight es6 files as JS files
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
" }}}

"""" Configuration of plugins

set wildignore+=*.png,*.jpg,*.svg,*.wof,*.zip,*.exe

" Airline /  Status bar {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
" }}}

" CtrlP {{{
let g:ctrlp_custom_ignore = 'node_modules'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --files-with-matches
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ -g ""'
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_dotfiles = 1
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif
" }}}

" Neomake {{{
let g:neomake_ruby_enabled_makers = ['mri']
" }}}

" Unite {{{
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" The Platinum Searcher
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Disable supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
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

" remap Q to something more useful than visual mode
map Q @q

" Undo files {{{
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" }}}

" Vimux/Vroom {{{
let g:vroom_use_vimux = 1
let g:vroom_use_spring = 1
let g:vroom_clear_screen = 0
" }}}

"""" Leader config {{{

let mapleader = ','
noremap \ ,

nnoremap <leader><space> :noh<CR>
nnoremap <leader>. :Unite -no-split -start-insert tag<CR>
nnoremap <leader>a :Unite -no-split grep:.<CR>
nnoremap <leader>b :Unite -no-split -start-insert buffer tab file_mru directory_mru<CR>
nnoremap <leader>ccb :%s/binding.pry/# binding.pry/<CR>
nnoremap <leader>cub :%s/# binding.pry/binding.pry/<CR>
nnoremap <leader>d :VroomRunTestFile<CR>
nnoremap <leader>gb :Gblame wCM<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <leader>p :Unite -no-split -start-insert file/vcs<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>f :Unite -no-split -start-insert file_rec/async<CR>
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

call plug#begin('~/.config/nvim/bundle')

""" Bundles {{{
" tpope's plugins {{{
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
" Sensible isn't needed in neovim - it's built in
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-speeddating'
" }}}

" neovim specific plugins {{{
Plug 'benekastah/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" }}}

" other authors {{{
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
Plug 'bronson/vim-visual-star-search'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'wellle/targets.vim'
Plug 'avdgaag/vim-phoenix'
" Plug 'lifepillar/vim-mucomplete'
Plug 'jbranchaud/vim-bdubs'
" Taken from https://gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" }}}

" Syntax highlighting {{{
Plug 'rodjek/vim-puppet'
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mtscout6/vim-cjsx'
Plug 'mxw/vim-jsx'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elixir-lang/vim-elixir' ", { 'for': ['ex', 'exs', 'eex'] }
Plug 'slashmili/alchemist.vim'
Plug 'berdandy/ansiesc.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'keith/rspec.vim', { 'for': 'ruby' }
" }}}

" colorschemes {{{
Plug 'chriskempson/base16-vim'
" }}}

call plug#end()
" End of Bundles }}}

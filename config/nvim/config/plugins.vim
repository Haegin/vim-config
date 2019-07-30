call plug#begin('~/.config/nvim/bundle')

""" Bundles {{{
" tpope's plugins {{{
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-endwise'
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
" Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-dadbod'
" }}}

" neovim specific plugins {{{
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
" Plug 'Shougo/echodoc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}

" Completion (incl. sources) {{{
" Taken from https://gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'mhartington/nvim-typescript', {  'for': ['typescript', 'typescript.tsx', 'tsx'], 'do': './install.sh' }
" Plug 'Shougo/neco-vim', { 'for': ['vim'] }
Plug 'wellle/tmux-complete.vim'
Plug 'rizzatti/dash.vim'
" Plug 'Shougo/neco-syntax'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'takkii/Bignyanco'
" }}}

" other authors {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
Plug 'bronson/vim-visual-star-search'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'wellle/targets.vim'
Plug 'avdgaag/vim-phoenix'
" Plug 'Shougo/neopairs.vim'
" Plug 'jiangmiao/auto-pairs'
" }}}

" Syntax highlighting and code formatting {{{
Plug 'rodjek/vim-puppet'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elixir-lang/vim-elixir' ", { 'for': ['ex', 'exs', 'eex'] }
Plug 'slashmili/alchemist.vim'
" Plug 'berdandy/ansiesc.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'keith/rspec.vim', { 'for': 'ruby' }
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'sbdchd/neoformat'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'jparise/vim-graphql'
Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
" Plug 'cohama/lexima.vim'
" }}}

" colorschemes {{{
Plug 'chriskempson/base16-vim'
" }}}

call plug#end()
" End of Bundles }}}

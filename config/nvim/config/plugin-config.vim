" Syntax {{{

"""" Configuration of plugins

" Trouble {{{
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
" }}}
"
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" TreeSitter {{{
lua << EOF
require'nvim-treesitter.configs'.setup {
    textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    },
}
EOF
" }}}

" Telescope {{{
lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,
      use_highlighter = true,
    }
  }
}
EOF
" }}}

" Status bar {{{
lua << EOF
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
EOF
" }}}

" FZF {{{
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0)

command! -bang -nargs=? -complete=dir ProjectFiles
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = "--graph --format=format:'%C(blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(white)— %C(bold cyan)%an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
" }}}

" " Neomake {{{
" call neomake#configure#automake('nw', 1000)
" let g:neomake_open_list = 2
" let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
" let g:neomake_elixir_enabled_makers = ['credo']
" let g:neomake_javascript_enabled_makers = ['eslint']
" " }}}

" NeoFormat {{{
" let g:neoformat_try_formatprg = 1
" augroup NeoformatAutoFormat
"   autocmd!
" "   autocmd FileType javascript,javascript.jsx setlocal formatprg="prettier --stdin"
"   autocmd BufWritePre *.ex,*.exs Neoformat
" augroup END
" let g:neoformat_enabled_javascript = ['prettier-eslint']
" }}}

" {{{ ALE
" let g:ale_linters = {
"       \ 'sql': ['sqlint'],
"       \ }

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
" }}}

" {{{ Splitjoin
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_hanging_args = 0
" }}}


" {{{ Language Server
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
    \ 'ruby': ['bundle', 'exec', 'solargraph', 'stdio'],
    \ }
" }}}

" {{{ Terraform
let g:terraform_fmt_on_save = 1
" }}}

" {{{ PostgreSQL
let g:sql_type_default = 'pgsql'
" }}}

" {{{ CoC
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
" }}}

" Tab Completion

set completeopt=longest,menuone,preview
set shortmess+=c
" For automatic completion, you most likely want one of:
" set completeopt+=noinsert ",noselect
" Automatically tab complete
" let g:mucomplete#enable_auto_at_startup = 1

" Omnifuncs {{{
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType elixir setlocal omnifunc=elixircomplete#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  " autocmd FileType typescript,tsx setlocal omnifunc=
augroup end
" }}}

" Tab forwards through completion entries
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" " Deoplete{{{
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('sources', {
"   \ '_': ['ale', 'buffer', 'tag']
"   \ })
" " if !exists('g:deoplete#omni#input_patterns')
" "   let g:deoplete#omni#input_patterns = {}
" " endif
" " let g:deoplete#omni#functions = {}
" " let g:deoplete#omni#functions.javascript = [
" "   \ 'tern#Complete',
" "   \ 'jspc#omni'
" " \]
" " let g:deoplete#sources = {}
" " let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer', 'tag']
" " let g:deoplete#sources['_'] = ['buffer', 'tag']
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" " deoplete tab-complete, with help from supertab
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
" " }}}
"
" " tern {{{
" if exists('g:plugs["tern_for_vim"]')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif
" " }}}

" COC{{{
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"}}}

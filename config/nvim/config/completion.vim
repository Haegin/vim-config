" Tab Completion

" set completeopt=longest,menuone,preview
set completeopt=menuone,noselect
set shortmess+=c
" For automatic completion, you most likely want one of:
" set completeopt+=noinsert ",noselect
" Automatically tab complete
" let g:mucomplete#enable_auto_at_startup = 1

" Compe {{{
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

" let g:compe.source.tabnine = {}
" let g:compe.source.tabnine.max_line = 1000
" let g:compe.source.tabnine.max_num_results = 6
" let g:compe.source.tabnine.priority = 5000
" " setting sort to false means compe will leave tabnine to sort the completion items
" let g:compe.source.tabnine.sort = v:false
" let g:compe.source.tabnine.show_prediction_strength = v:true
" let g:compe.source.tabnine.ignore_pattern = ''

lua << EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
" }}}

" Omnifuncs {{{
" augroup omnifuncs
"   autocmd!
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"   autocmd FileType elixir setlocal omnifunc=elixircomplete#Complete
"   autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"   " autocmd FileType typescript,tsx setlocal omnifunc=
" augroup end
" }}}

" Tab forwards through completion entries
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

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
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"}}}

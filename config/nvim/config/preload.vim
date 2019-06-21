" Ale {{{
let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 1
" let g:ale_cursor_detail = 1
" let g:ale_close_preview_on_insert = 1
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_lint_on_insert_leave = 0
let g:ale_linters_explicit = 1
let g:ale_list_window_size = 5
let g:ale_linter_aliases = {
      \ 'javascript.jsx': 'javascript',
      \ 'typescript.tsx': 'typescript',
      \ }
" }}}

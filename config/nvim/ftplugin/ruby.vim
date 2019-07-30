autocmd FileType ruby let b:dispatch = 'spring rspec %'

let b:ale_fixers = ['rubocop', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_linters = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'

" Ident by the normal distance after lines such as `foo = if`
let g:ruby_indent_assignment_style = 'variable'

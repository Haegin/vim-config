autocmd FileType ruby let b:dispatch = 'spring rspec %'

let b:ale_fixers = ['rubocop', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_linters = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'

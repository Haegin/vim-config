let g:clipboard = {
  \     'name': 'macos+tmux',
  \     'copy': {
  \       '+': [ 'pbcopy' ],
  \       '*': ['tmux', 'load-buffer', '-'],
  \     },
  \     'paste': {
  \       '+': [ 'pbpaste' ],
  \       '*': ['tmux', 'save-buffer', '-'],
  \     },
  \     'cache_enabled': 0,
  \ }

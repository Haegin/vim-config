" Configure colour scheme {{{
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
else
  set background=dark
  colorscheme base16-tomorrow
endif
" }}}

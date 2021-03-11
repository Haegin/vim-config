" Configure colour scheme {{{
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
else
  set background=dark
  colorscheme base16-railscasts
endif
" }}}

" 24 bit colour support!
set termguicolors

" override highlight in theme to set bg to match Tmux
" If you change theme, run :hi Normal to see what the existing settings are and
" adjust.
highlight Normal ctermfg=7 ctermbg=none guifg=#e6e1dc guibg=none

" First section
execute "hi User1 guibg=" . g:terminal_color_6 . " guifg=" . g:terminal_color_0
" First divider
execute "hi User2 guibg=" . g:terminal_color_3 . " guifg=" . g:terminal_color_6
execute "hi User3 guibg=" . g:terminal_color_3 . " guifg=" . g:terminal_color_0
execute "hi User4 guibg=" . g:terminal_color_4 . " guifg=" . g:terminal_color_3
execute "hi User5 guibg=" . g:terminal_color_4 . " guifg=" . g:terminal_color_0
execute "hi User6 guibg=" . g:terminal_color_8 . " guifg=" . g:terminal_color_4
execute "hi User7 guibg=" . g:terminal_color_8 . " guifg=" . g:terminal_color_0
" 2 = green, 3 = yellow, 4 = blue, 5 = purple, 6 = dark green, 7 = light grey, 8 = dark purple, 9 = red

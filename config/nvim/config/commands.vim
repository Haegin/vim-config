"""" Ruby related commands {{{
command! -range HashOldToNew <line1>,<line2>s/\v:([A-z_?]+) ( *)\=\>/\1:\2/g
command! -range HashNewToOld <line1>,<line2>s/\v([A-z_?]+):( *) /:\1 \2=> /g

command! PromoteToLet s/@\?\(\w\+\) = \(.*\)$/let(:\1) { \2 }/ | norm ==

command! -range ReplaceQuotes <line1>,<line2>s/\v'([^']+)'/"\1"/g

command! RspecLet norm ^ilet(:elcf=) {A }
command! RspecSubject norm bisubject(:elcf=) {A }
" }}}

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'|tr -d "\017"', 1, <bang>0)

"""" Custom commands {{{
command! -range HashOldToNew <line1>,<line2>s/\v:([A-z_?]+) ( *)\=\>/\1:\2/g
command! -range HashNewToOld <line1>,<line2>s/\v([A-z_?]+):( *) /:\1 \2=> /g

command! PromoteToLet s/@\?\(\w\+\) = \(.*\)$/let(:\1) { \2 }/ | norm ==

command! -range ReplaceQuotes <line1>,<line2>s/\v'([^']+)'/"\1"/g

command! RspecLet norm ^ilet(:elcf=) {A }
command! RspecSubject norm bisubject(:elcf=) {A }
" }}}

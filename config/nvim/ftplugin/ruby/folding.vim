" setlocal foldmethod=expr
" " set foldlevelstart=1

" " Custom folding derived from Steve Losh's learn vimscript the hard way chap 49
" setlocal foldexpr=GetRubyFold(v:lnum)

" function! NextNonBlankLine(lnum)
"   let numlines = line('$')
"   let current = a:lnum + 1

"   while current <= numlines
"     if getline(current) =~? '\v\S'
"       return current
"     endif

"     let current += 1
"   endwhile

"   return -2
" endfunction

" function! IndentLevel(lnum)
"   return indent(a:lnum) / &shiftwidth
" endfunction

" function! GetRubyFold(lnum)
"   let line = getline(a:lnum)

"   " if line =~? '\v^\s*$'
"   "   return "-1"
"   " endif

"   let stack = synstack(a:lnum, 1)
"   for synid in stack
"     if synIDattr(synid, "name") == "rubyMethodBlock"
"       return "1"
"     endif
"   endfor

"   if line =~? '\v\Wdef\W'
"     return "1"
"   endif

"   return "0"
" endfunction

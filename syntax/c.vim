"highlight Functions
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=bold  ctermfg=blue

"----------------------------------------------
syn match cMathOperator display "[-+*/%=]"
syn match cPointerOperator	display "-> \| \."



"----------------------------------------------
hi def link cMathOperator		 cOperator
hi def link cPointerOperator	 cOperator





"----------------------------------------------

hi cOperator gui=NONE ctermfg=Magenta

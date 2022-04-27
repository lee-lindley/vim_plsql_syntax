" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Lee Lindley (lee dot lindley at gmail dot com)
" Last Change:	2022-04-20
" https://github.com/lee-lindley/vim_plsql_syntax

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "lee"
hi Normal	                    ctermfg=Cyan        guifg=#19D9FF   guibg=Black
"guibg=black
" .s, .sl, .sx Literal.String
hi Constant	    term=underline	ctermfg=LightRed	guifg=#EC7600
" .nv   Name.Variable 
hi Character    term=underline	ctermfg=Cyan		guifg=#00CCCC
" .m .mf .mi    Literal.Number
hi Number       term=underline	ctermfg=LightRed	guifg=#FFB319
hi Boolean      term=underline	ctermfg=LightRed	guifg=#FFB319
" .kt Keyword.Type
hi Type	        term=underline	ctermfg=LightGreen	guifg=#008B2F   gui=bold
" .kr Keyword.Reserved (CREATE IS)
hi Statement    term=underline  ctermfg=LightGreen  guifg=#00CC00   gui=bold        cterm=bold 
" .k (nreserved) if we separate them (PROCEDURE RETURN DETERMINISTIC) #00CC88 bold
"hi Keyword term=underline term=bold ctermfg=LightGreen guifg=#00CC88 gui=bold
" .nf vim Function (REGEXP_REPLACE) #4DFFFF
hi Identifier   term=bold		ctermfg=Brown       guifg=#4DFFFF 
"hi Function term=bold		    ctermfg=Brown       guifg=#4DFFFF 
" .c .cm .c1
hi Comment	    term=bold		ctermfg=White       guifg=#FEFDFF   gui=italic 
" .cp Comment.Preproc
hi PreProc	    term=underline	ctermfg=LightBlue   guifg=#FEFDFF   gui=bold
" .p Punctuation
hi Special	    term=bold		ctermfg=Yellow	    guifg=#ffffb3
" .o Operator
hi Operator     term=bold		ctermfg=Yellow	    guifg=#CCCC00
hi Ignore				        ctermfg=black	    guifg=bg
hi Error	    term=reverse    ctermfg=White       guifg=White     guibg=Red       ctermbg=Red     
hi Todo	        term=standout   ctermfg=Black       guifg=Blue      guibg=Yellow    ctermbg=Yellow  
" set foldcolumn=2
hi Folded                       ctermfg=Black       guifg=Black     guibg=DarkGray  ctermbg=DarkGray
hi FoldColumn                   ctermfg=DarkRed     guifg=DarkRed   guibg=DarkGray  ctermbg=DarkGray
" .k Keyword #00CC88 bold
" .nf Name.Function #4DFFF
" .ow Operator.Word #CCCC00 bold

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	    Constant
"hi link Character	Constant
"hi link Boolean	Constant
hi link Function    Identifier
hi link Float		Number
hi link Repeat      Statement
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	    Statement
hi link Exception	Statement
hi link Include	    PreProc
hi link Define	    PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass    Type
hi link Structure	Type
hi link Typedef	    Type
hi link Tag		    Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special

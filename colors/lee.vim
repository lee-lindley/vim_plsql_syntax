" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "lee"
hi Normal		guifg=#19D9FF			guibg=black
" .s, .sl, .sx Literal.String
hi Constant	term=underline	ctermfg=Magenta		guifg=#EC7600
" .nv   Name.Variable 
hi Character term=underline	ctermfg=Magenta		guifg=#00CCCC
" .m .mf .mi    Literal.Number
hi Number   term=underline	ctermfg=Magenta		guifg=#FFB319
hi Boolean  term=underline	ctermfg=Magenta		guifg=#FFB319
" .kt Keyword.Type
hi Type	term=underline		ctermfg=LightGreen	guifg=#008B2F gui=bold
" .kr Keyword.Reserved (CREATE IS)
hi Identifier term=underline cterm=bold ctermfg=Cyan    guifg=#00CC00 gui=bold
" .k (nreserved) can be Statement if we separate them (PROCEDURE RETURN DETERMINISTIC) #00CC88 bold
hi Statement term=bold		ctermfg=Yellow              guifg=#00CC88 gui=bold
" .nf can be vim Function (REGEXP_REPLACE) #4DFFFF
hi Function term=bold		ctermfg=Yellow              guifg=#4DFFFF 
" .c .cm .c1
hi Comment	term=bold		ctermfg=DarkCyan    guifg=#FEFDFF gui=italic 
" .cp Comment.Preproc
hi PreProc	term=underline	ctermfg=LightBlue	guifg=#FEFDFF gui=bold
" .p Punctuation
hi Special	term=bold		ctermfg=DarkMagenta	guifg=#ffffb3
" .o Operator
hi Operator term=bold		ctermfg=Red			guifg=#CCCC00
hi Ignore				ctermfg=black		guifg=bg
hi Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

" .k Keyword #00CC88 bold
" .nf Name.Function #4DFFF
" .ow Operator.Word #CCCC00 bold

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	Constant
"hi link Character	Constant
"hi link Boolean	Constant
"hi link Function    Identifier
hi link Float		Number
hi link Repeat      Statement
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	    Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special

" Syntax Highlight TODO WTF FIXME NOTE REVIEW BUG ERROR BROKEN HACK

"syn match severe /\v<(ERROR|BROKEN|WTF)/ containedin=.*Comment,vimCommentTitle

"hi def link severe Error

syntax keyword severe contained BROKEN WTF ERROR
syntax keyword warnings contained FIXME HACK BUG REVIEW
syntax keyword regular contained TODO NOTE

hi def link severe Error
hi def link warnings Todo
hi def link regular DiffText

""hi severe   ctermfg=233       ctermbg=Red       cterm=Bold
""hi normal   ctermfg=233       ctermbg=Yellow    cterm=Bold
""hi regular  ctermfg=233       ctermbg=118       cterm=Bold


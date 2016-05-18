syn match severe /\v<(ERROR|BROKEN|WTF)/ containedin=.*Comment,vimCommentTitle

hi def link severe Error


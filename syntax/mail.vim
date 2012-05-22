
"ino à a`
"ino è e`
"ino È E`
"ino é e'
"ino ì i`
"ino ò o`
"ino ù u`
hi Identifier term=underline ctermfg=DarkCyan guifg=DarkCyan

set textwidth=0

" match per aperture/chiusure non terminate.
syn match unmatchedstart display "\*[%#\$]"me=e
syn match unmatchedend display "[%#\$]\*"me=e
hi def link unmatchedstart Error
hi def link unmatchedend Error

" link vari.
syn match Separator "::" contained
syn match movieTitle "\*%.\{-1,}%\*" contains=Separator
syn match personName "\*\$.\{-1,}\$\*" contains=Separator
syn match urlLink "\*#.\{-1,}#\*" contains=Separator

hi def link movieTitle Number
hi def link personName Statement
hi def link urlLink Comment
hi def link Separator Function


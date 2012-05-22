" Knews
if getline(1) =~ "^X-Newsreader"
  so <sfile>:p:h/syntax/mail.vim
elseif getline(3) =~ "^X-Newsreader"
  so <sfile>:p:h/syntax/mail.vim
elseif getline(1) =~ "^Path"
  so <sfile>:p:h/syntax/mail.vim
endif


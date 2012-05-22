if !exists("g:my_python_functions")
let g:my_python_functions = "true"
"
" Tip: set indent parameters for python files.
" Version: 0.1
" Date: 13 May 2006
" Description: most python scripts use four spaces for indenting, but
"              sometimes you will end up editing a script where tabs
"              are used; in these situations it can be useful to
"              automatically detect whether spaces or tabs were used,
"              and set some parameters (or call some functions) consequently.
" Usage: you can put this script in you vimrc and call the PyIndentAutoCfg
"        function with an autocmd associated to python files, or call
"        it manually, or put it in the python.vim syntax script, or... :-)

" Function to set parameters for python scripts that use
" spaces for indention.  This is also the default.  YMMV.
function PySpacesCfg()
  set expandtab " use spaces in place of tabs.
  set tabstop=8 " number of spaces for a tab.
  set softtabstop=4 " number of spaces for a tab in editing operations.
  set shiftwidth=4 " number of spaces for indent (>>, <<, ...)
endfunction

" Function to set parameters for python scripts that use
" tabs for indention.  YMMV.
function PyTabsCfg()
  set noexpandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfunction

" This function returns 1 if the file looks like a python script
" that uses tabs for indenting, or 0 otherwise.
function PyIsTabIndent()
  let lnum = 1
  let max_lines = 100 " max number of lines to check.
  let got_tabs = 0
  let got_cols = 0 " 1 if the previous lines ended with columns.
  while lnum <= max_lines
    let line = getline(lnum)
    let lnum = lnum + 1
    if got_cols == 1
      if line =~ "^\t\t" " at least two tabs, to prevent false-positives.
	let got_tabs = 1
	break
      endif
    endif
    if line =~ ":\s*$"
      let got_cols = 1
    else
      let got_cols = 0
    endif
  endwhile

  return got_tabs
endfunction

" Check the file, and run the relative function.
function PyIndentAutoCfg()
  if PyIsTabIndent() == 1
    call PyTabsCfg()
  else
    call PySpacesCfg()
  endif
endfunction

" Call the PyIndentAutoCfg function.  Uncomment this line if you've copied
" this script in the python.vim syntax file or something like that.
endif
call PyIndentAutoCfg()

let python_highlight_all = 1 " misc syntax highlighting.


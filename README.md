Installation
============

    git clone git://github.com/alberanid/vim-config.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

Dependencies
============

* **python-jedi** for Python autocompletition (vim-jedi)

* **Powerline/Airline fonts**:  
    mkdir -p ~/.fonts/  
    cp ~/.vim/powerline-fonts/* ~/.fonts/  
    fc-cache -fv  

Also notice that you probably want to setup your terminal with the solarized palette: http://ethanschoonover.com/solarized

Plugin management
=================

Upgrade installed plugins
-------------------------

    git submodule foreach git pull origin master

Add a new plugin
----------------

    git submodule add git://example.com/git/plugin-name.git bundle/plugin-name
    git submodule init
    git submodule update

Remove a plugin
---------------
    git submodule deinit bundle/plugin-name
    git rm bundle/plugin-name


Main commands and shortcuts
===========================

**Don't forget some VIM basics:**
* _Leader_ char is backslash (**\\**), by default
* **:e filename** edit filename in a new buffer
* **:sp** for horizontal split
* **:vsp** for vertical split
* **ctrl+w** and movements to navigate splits
* **ctrl+w** and **q** to close a split
* **bX** (where X is the buffer number in the topbar) to change buffer
* **:bd** to close a buffer
* register **"\*** to copy/paste to/from the primary selection (e.g. **"\*p**)
* register **"+** to copy/paste to/from the system clipboard (e.g. **"+p**)

**And some toggles:**
* **F2** yank list (enter to put in place, or **p**aste commands to insert in a near line)
* **F4** NERDTree
* **F5** spell checker
* **F8** Tagbar
* **F9** paste mode
* **F10** Gundo

**Seach and simple refactoring (EasyGrep):**
* **\\vv** grep the word under the cursor (**\\vV** to match the whole word)
* **\\vR** grep the whole word and prompt for a replacement
* **\\vyr** toggle recursive search and **\\vyi** case insensitive mode

**Commenting (NERD Commenter) and editing (surround):**
* **\\c<space>** toggle comment of current line
* **\\cs** toggle comment using multipart delimeters
* **ds)** remove () around a string
* **cs)]** to replace () with [] around a string enclosed by ()


Author and license
==================

    Davide Alberani <da@erlug.linux.it> (C) 2013-2016
    Released under the terms of the CC BY-SA license: https://creativecommons.org/licenses/by-sa/4.0/

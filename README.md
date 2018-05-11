Installation
============

    git clone git://github.com/alberanid/vim-config.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init --recursive
    cd bundle/YouCompleteMe
    ./install.py --clang-completer --go-completer --js-completer --java-completer

Dependencies
============

* **exuberant-ctags** for the tagbar
* **flake8** and **pylint** for Python linting
* **eslint** for JavaScript linting (must be configured with *eslint --init*)
* **Go** if you plan to use --go-completer with YouCompleteMe
* **Node.js** and **npm** if you plan to use --js-completer with YouCompleteMe
* **JDK 8** if you plan to use --java-completer with YouCompleteMe

Also notice that you probably want to setup your terminal with the solarized palette: http://ethanschoonover.com/solarized

Plugin management
=================

Upgrade installed plugins
-------------------------

    git submodule foreach git pull origin master

Add a new plugin
----------------

    git submodule add git://example.com/git/plugin-name.git bundle/plugin-name
    git submodule update --init --recursive

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
* register **"*** to copy/paste to/from the primary selection (e.g. **"\*p** - to use this and **"+** you must have a version of Vim compiled with clipboard support: install vim-gtk or vim-gnome)
* register **"+** to copy/paste to/from the system clipboard (e.g. **"+p**)
* **ctrl+x ctrl+k** complete using dictionaries

**And some toggles:**
* **F2** yank list (enter to put in place, or **p**aste commands to insert in a near line)
* **F4** NERDTree
* **F5** spell checker
* **F8** Tagbar
* **F9** paste mode
* **F10** Undotree
* **F12** mouse mode

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

    Davide Alberani <da@erlug.linux.it> (C) 2013-2018
    Released under the terms of the CC BY-SA license: https://creativecommons.org/licenses/by-sa/4.0/

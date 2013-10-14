#!/bin/sh

sudo apt-get install curl make git emacs

mv ~/.emacs.d  ~/.backup_emacs.d
mv ~/.emacs  ~/.backup_emacs

git clone git@github.com:jpkorhonen/emacs-config.git ~/.emacs.d
cd ~/.emacs.d
# git remote add coffee-mode https://github.com/defunkt/coffee-mode.git
git clone  https://github.com/defunkt/coffee-mode.git
git clone git://github.com/daleharvey/jshint-mode.git
make install

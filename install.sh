#!/bin/sh

mv ~/.emacs.d  ~/.backup_emacs.d
mv ~/.emacs  ~/.backup_emacs

git clone git@github.com:jpkorhonen/emacs-config.git ~/.emacs.d
cd ~/.emacs.d
make install
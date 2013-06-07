#!/bin/bash

DOT_FILES=( .zshrc .zshenv .gitconfig .gitignore .tmux.conf .vimrc .vimperatorrc .vrapperrc .Xmodmap .neosnippets)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

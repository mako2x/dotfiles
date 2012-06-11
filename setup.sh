#!/bin/bash

DOT_FILES=( .zshrc .zshenv .gitconfig .gitignore .tmux.conf .vimrc .vimperatorrc .Xmodmap .mayu)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/vifmrc $HOME/.vifm/vifmrc

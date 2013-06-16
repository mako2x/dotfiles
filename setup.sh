#!/bin/bash

for file in `ls -A $HOME/dotfiles | grep '^\.' | egrep -v '^\.git$|\.DS_Store'`
do
  if [ -a $HOME/$file ]; then
    echo "File exists: $HOME/$file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "Created symlink: $HOME/$file"
  fi
done

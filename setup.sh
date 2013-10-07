#!/bin/bash

cd `dirname $0`
dir=`pwd`

for file in `ls -A $dir | grep '^\.' | egrep -v '^\.git$|\.DS_Store|\.gitconfig.local.sample'`
do
  if [ -a $HOME/$file ]; then
    echo "File exists: $HOME/$file"
  else
    ln -s $dir/$file $HOME/$file
    echo "Created symlink: $HOME/$file"
  fi
done

[ -a $dir/.gitconfig.local ] || cp $dir/.gitconfig.local.sample $dir/.gitconfig.local && echo "Created .gitconfig.local"

# Color
export TERM=screen-256color

# Use Vim
export EDITOR=vim

# Path
PATH=$PATH:$HOME/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/sbin

# rbenv
if [ -d $HOME/.rbenv  ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"
fi

# nodebrew
if [[ -f $HOME/.nodebrew/nodebrew ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# android-sdk
export ANDROID_HOME=$HOME/android-sdk
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export PATH=$ANDROID_HOME:$PATH

# bundle exec
export PATH=./bin:$PATH

# tmux
if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
  if ( tmux has-session ); then
    session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
    if [ -n "$session" ]; then
      echo "Attache tmux session $session."
      tmux attach-session -t $session
    else
      echo "Session has been already attached."
      tmux list-sessions
    fi
  else
    echo "Create new tmux session."
    tmux -2
  fi
fi

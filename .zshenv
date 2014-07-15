# Color
export TERM=screen-256color

# Use Vim
export EDITOR=vim

# Path
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"
fi

# nodebrew
if [ -d $HOME/.nodebrew ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# phpenv
if [ -d $HOME/.phpenv ]; then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi

# golang
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# android-sdk
export ANDROID_HOME=$HOME/android-sdk
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export PATH=$ANDROID_HOME:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/mako/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/mako/android-ndk
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/bin
export PATH=$ANT_ROOT:$PATH

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

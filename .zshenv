## Use Vim
export EDITOR=vim

## Path
PATH=$PATH:$HOME/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/sbin

## rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

## nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
if [[ -f ~/.nodebrew/nodebrew ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew use v0.6.19 > /dev/null
fi

## android-sdk
export PATH=$HOME/android/android-sdk-linux/tools:$PATH


###################################
# tmux
###################################
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

export TERM=screen-256color


####################################
## Set vi mode status bar
####################################
#readuntil () {
#  typeset a
#  while [ "$a" != "$1" ]
#  do
#    read -E -k 1 a
#  done
#}
#
##
## If the $SHOWMODE variable is set, displays the vi mode, specified by
## the $VIMODE variable, under the current command line.
## 
## Arguments:
##
##   1 (optional): Beyond normal calculations, the number of additional
##   lines to move down before printing the mode.  Defaults to zero.
##
#showmode() {
#  typeset movedown
#  typeset row
#
#  # Get number of lines down to print mode
#  movedown=$(($(echo "$RBUFFER" | wc -l) + ${1:-0}))
#  
#  # Get current row position
#  echo -n "\e[6n"
#  row="${${$(readuntil R)#*\[}%;*}"
#  
#  # Are we at the bottom of the terminal?
#  if [ $((row+movedown)) -gt "$LINES" ]
#  then
#    # Scroll terminal up one line
#    echo -n "\e[1S"
#    
#    # Move cursor up one line
#    echo -n "\e[1A"
#  fi
#  
#  # Save cursor position
#  echo -n "\e[s"
#  
#  # Move cursor to start of line $movedown lines down
#  echo -n "\e[$movedown;E"
#  
#  # Change font attributes
#  echo -n "\e[1m"
#  
#  # Has a mode been set?
#  if [ -n "$VIMODE" ]
#  then
#    # Print mode line
#    echo -n "-- $VIMODE -- "
#  else
#    # Clear mode line
#    echo -n "\e[0K"
#  fi
#
#  # Restore font
#  echo -n "\e[0m"
#  
#  # Restore cursor position
#  echo -n "\e[u"
#}
#
#clearmode() {
#  VIMODE= showmode
#}
#
##
## Temporary function to extend built-in widgets to display mode.
##
##   1: The name of the widget.
##
##   2: The mode string.
##
##   3 (optional): Beyond normal calculations, the number of additional
##   lines to move down before printing the mode.  Defaults to zero.
##
#makemodal () {
#  # Create new function
#  eval "$1() { zle .'$1'; ${2:+VIMODE='$2'}; showmode $3 }"
#
#  # Create new widget
#  zle -N "$1"
#}
#
## Extend widgets
#makemodal vi-add-eol           INSERT
#makemodal vi-add-next          INSERT
#makemodal vi-change            INSERT
#makemodal vi-change-eol        INSERT
#makemodal vi-change-whole-line INSERT
#makemodal vi-insert            INSERT
#makemodal vi-insert-bol        INSERT
#makemodal vi-open-line-above   INSERT
#makemodal vi-substitute        INSERT
#makemodal vi-open-line-below   INSERT 1
#makemodal vi-replace           REPLACE
#makemodal vi-cmd-mode          NORMAL
#
#unfunction makemodal

###################################
# Vim mode
###################################
bindkey -v
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
bindkey "^R" history-incremental-search-backward


###################################
# Change Directory
###################################
setopt auto_cd
setopt auto_pushd
cdpath=(~)
chpwd_functions=($chpwd_functions dirs)


###################################
# History
###################################
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt no_flow_control


###################################
# Prompt
###################################
setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt
autoload -Uz colors
colors
PROMPT="%(!.#.$) "
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "


###################################
# Completion
###################################
autoload -U compinit
compinit -u
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select
zstyle ':completion:*:default' list-colors ""
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' completer \
    _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' verbose yes
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
setopt complete_in_word
setopt glob_complete
setopt hist_expand
setopt no_beep
setopt numeric_glob_sort


###################################
# Extending
###################################
setopt magic_equal_subst
setopt extended_glob
setopt mark_dirs


###################################
# Word
###################################
WORDCHARS=${WORDCHARS:s,/,,}
WORDCHARS="${WORDCHARS}|"


###################################
# tmux
###################################
function chpwd(){
  [ -n $TMUX ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD
}


###################################
# auto-fu.zsh
###################################
if [ -f ~/.zsh/auto-fu.zsh ]; then
  source ~/.zsh/auto-fu.zsh
  function zle-line-init() {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
  zstyle ':auto-fu:highlight' input bold
  zstyle ':auto-fu:var' postdisplay ''
fi


###################################
# z.sh
###################################
_Z_CMD=j
source ~/.zsh/z.sh
precmd() {
  _z --add "$(pwd -P)"
}


###################################
# bower
###################################
if [ -f ~/.zsh/bower_completion.zsh ]; then
  source ~/.zsh/bower_completion.zsh
fi


###################################
# Show vim mode
###################################
#function zle-line-init zle-keymap-select {
#  case $KEYMAP in
#    vicmd)
#      PROMPT="%{$fg[green]%}$%{$reset_color%} "
#    ;;
#    main|viins)
#      PROMPT="%{$reset_color%}$ "
#    ;;
#  esac
#  zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select


###################################
# mkdir & cd
###################################
function mkcd {
  nocorrect mkdir -p "$1" && cd "$1"
}


###################################
# timer
###################################
function timer {
 sleep `expr $1 '*' 60`
 /Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier -message "$1分経過" &
 say la la la la la la la la la la
}


###################################
## Webrick
####################################
function webrick() {
  RSERVER_VERBOSE=no
  [ "$RSERVER_VERBOSE" != no ] && echo "arguments : $@"

  RSERVER_SCRIPT=`cat <<EOS
require 'webrick'

doc_root = ARGV.shift || 'html'
doc_root = File::join(Dir::pwd, doc_root)
server = WEBrick::HTTPServer::new( :Port => 8888, :DocumentRoot => doc_root)
trap("INT") {
server.shutdown
}
server.start;
EOS
`
  [ "$RSERVER_VERBOSE" != no ] && echo "RSERVER_SCRIPT : ${RSERVER_SCRIPT}"

  ruby -e "$RSERVER_SCRIPT" $@
}


####################################
## Extract
####################################
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}




###################################
# Alias
###################################
alias ls='ls -GF'
alias la='ls -AFG'
alias ll='ls -FGals'
alias mk='mkdir'
alias ...='cd ../../'
alias ....='cd ../../../'
alias s='sudo'
alias tm='tmux'
alias rb='ruby'
alias cf='coffee'
alias bi='bundle install --binstubs --shebang ruby-local-exec --path vendor/bundle'
alias bui='bundle install --path vendor/bundle'
alias gem='rbenv exec gem'
alias rgrep='find . -prune -o -type f -print0 | xargs -0 grep'
alias df='df -h'
alias clone='hub clone'
alias xclip='xclip -sel clip'
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
case ${OSTYPE} in
  darwin*)
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias cot='open $1 -a /Applications/CotEditor.app'
    alias chrome='open $1 -a Google\ Chrome'
    ;;
  linux*)
    alias vi='vim'
    ;;
esac

## Edit Config File
alias ezsh='vi ~/dotfiles/.zshrc'
alias ezshenv='vi ~/dotfiles/.zshenv'
alias evim='vi ~/dotfiles/.vimrc'

## Shortcut
alias cdd='cd ~/Dropbox/'
alias cddd='cd ~/Dropbox/doc/'
alias cdw='cd ~/Dropbox/work/'
alias cdk='cd ~/Desktop/'

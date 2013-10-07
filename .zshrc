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
autoload -U colors; colors

function rprompt-git-current-branch {
        local name st color

        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        if [[ -z $name ]]; then
                return
        fi
        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=${fg[green]}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=${fg[yellow]}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=${fg_bold[red]}
        else
                color=${fg[red]}
        fi

        echo "%{$color%}$name%{$reset_color%} "
}

setopt prompt_subst
RPROMPT='[`rprompt-git-current-branch`%~]'


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
# npm-completion
###################################
COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi


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
  nocorrect mkdir -p "$1" && cd "$1" && pwd
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
## Auto rbenv rehash
####################################
function gem() {
  $HOME/.rbenv/shims/gem $*
  if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
  then
    rbenv rehash
    rehash
  fi
}


####################################
## Create or Edit Gemfile
####################################
function gemfile() {
  if [ -f Gemfile ]; then
    vi Gemfile
  else
    bundle init
    sleep 1
    vi Gemfile
  fi
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


####################################
## Padrino generate
####################################
function pagenerate() {
  padrino g project $1 -t rspec -e slim -c compass -s jquery -d datamapper -b
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
alias cf='coffee'
alias gi='git'
alias g='git'

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

## Ruby
alias rb='ruby'
alias b='bundle exec'
alias bi='bundle install --path vendor/bundle'
alias bib='bundle install --binstubs --shebang ruby-local-exec --path vendor/bundle'
alias brake='bundle exec rake'
alias brakejp="bundle exec rake args='-AppleLanguages \"(ja)\"' NSZombieEnabled=YES"
alias pa='bundle exec padrino'
alias pas='bundle exec padrino start'
alias pao='open http://localhost:3000'
alias paoa='open http://localhost:3000/admin'
alias par='bundle exec padrino rake'
alias pards='bundle exec padrino rake db:seed'
alias pardm='bundle exec padrino rake db:migrate'
alias parr='bundle exec padrino rake routes'
alias pars='bundle exec padrino rake spec'
alias pag='bundle exec padrino g'
alias pagm='bundle exec padrino g model'
alias pagc='bundle exec padrino g controller'
alias pagmi='bundle exec padrino g migration'
alias paga='bundle exec padrino g admin'
alias pagap='bundle exec padrino g admin_page'

## Edit Config File
alias ezsh='vi ~/dotfiles/.zshrc'
alias ezshenv='vi ~/dotfiles/.zshenv'
alias evim='vi ~/dotfiles/.vimrc'

## Shortcut
alias cdd='cd ~/Dropbox/'
alias cddd='cd ~/Dropbox/doc/'
alias cdw='cd ~/Dropbox/work/'
alias cdk='cd ~/Desktop/'

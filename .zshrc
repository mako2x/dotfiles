###################################
# Vim mode
###################################
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
bindkey "^[p" history-beginning-search-backward
bindkey "^[n" history-beginning-search-forward


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
PROMPT="%(!.#.$) "
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


[ -f ~/.zshrc.alias ]    && source ~/.zshrc.alias
[ -f ~/.zshrc.function ] && source ~/.zshrc.function
[ -f ~/.zshrc.plugin ]   && source ~/.zshrc.plugin
[ -f ~/.zshrc.peco ]     && source ~/.zshrc.peco

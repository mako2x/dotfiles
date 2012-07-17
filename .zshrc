###################################
# Alias
###################################
alias ls='ls -GF'
alias la='ls -AFG'
alias ll='ls -FGals'
alias mk='mkdir'
alias rr='rm -i'
alias df='df -h'
alias vi='vim'
alias s='sudo '
alias tm='tmux -2'
alias cf='coffee'
alias apti='sudo apt-get install'
alias aptu='sudo apt-get update'
alias aptr='sudo apt-get remove'
alias cc='chkconfig'
alias execzsh='exec $SHELL'
alias remayu='sudo /etc/init.d/mayu restart'
alias xclip='xclip -sel clip'
alias mocha='mocha --reporter spec'
alias webrick='ruby ~/bin/httpd.rb ./'

## SSH & SCP
alias sshsakura='ssh mako@49.212.23.11 -p 10022'
alias sshisc='ssh mako@isc.sfc.wide.ad.jp -p 456 '
alias sshwebedit='ssh t09366mk@webedit.sfc.keio.ac.jp'

## Ruby rbenv & bundle
alias bi='bundle install --path vendor/bundle'
alias be='bundle exec'
alias bruby='bundle exec ruby'
alias brake='bundle exec rake'
alias brails='bundle exec rails'
alias bpadrino='bundle exec padrino'
alias bruckup='bundle exec ruckup'
alias brspec='bundle exec rspec'
alias rgem='rbenv exec gem'

## Edit Config
alias ezsh='vim ~/dotfiles/.zshrc'
alias ezshenv='vim ~/dotfiles/.zshenv'
alias evim='vim ~/dotfiles/.vimrc'
alias evimp='vim ~/dotfiles/.vimperatorrc'
alias evifm='vim ~/dotfiles/.vifm/vifmrc'
alias etmux='vim ~/dotfiles/.tmux.conf'
alias egit='vim ~/dotfiles/.gitconfig'
alias emayu='vim ~/dotfiles/.mayu'

## Shortcut
alias cdm='cd /home/mako/'
alias cdw='cd ~/work/'
alias cddt='cd ~/Desktop/'
alias cddc='cd ~/Documents/'
alias cdisc='cd ~/Documents/isc/'
alias cddb='cd ~/Dropbox/'


###################################
# Vim keybind
###################################
bindkey -v


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
autoload colors
colors
PROMPT="%(!.#.$) "
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "


###################################
# Completion
###################################
autoload -U compinit
compinit
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
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
# mkdir & cd
###################################
function mkcd {
  nocorrect mkdir -p "$1" && cd "$1"
}

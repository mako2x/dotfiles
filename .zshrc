# Alias
alias ls='ls -AF --color'
alias ll='ls -l -h --color'
alias lv="lv -c -E'vim -c %d"
alias md='mkdir'
alias rr='rm -i'
alias df='df -h'
alias vi='vim'
alias s='sudo '
alias tm='tmux'
alias apti='sudo apt-get install'
alias aptu='sudo apt-get update'
alias aptr='sudo apt-get remove'
alias cc='chkconfig'
alias rezsh='source ~/.zshrc'
alias remayu='sudo /etc/init.d/mayu restart'
alias xclip='xclip -sel clip'

## SSH
alias sshsakura='ssh mako@49.212.23.11 -p 10022'
alias sshisc='ssh mako@isc.sfc.wide.ad.jp -p 456 '
alias sshwebedit='ssh t09366mk@webedit.sfc.keio.ac.jp'

## Ruby rbenv & bundle
alias bi='bundle install --path vendor/bundle'
alias be='bundle exec'
alias bruby='bundle exec ruby'
alias brake='bundle exec rake'
alias brails='bundle exec rails'
alias bruckup='bundle exec ruckup'
alias rgem='rbenv exec gem'

## Edit Config
alias ezsh='vim ~/.zshrc'
alias ezshenv='vim ~/.zshenv'
alias evim='vim ~/.vimrc'
alias evimp='vim ~/.vimperatorrc'
alias evifm='vim ~/.vifm/vifmrc'
alias etmux='vim ~/.tmux.conf'
alias egit='vim ~/.gitconfig'
alias emayu='vim ~/.mayu'

## Shortcut
alias cdm='cd /home/mako/'
alias cdw='cd ~/work/'
alias cddt='cd ~/Desktop/'
alias cddc='cd ~/Documents/'
alias cdisc='cd ~/Documents/isc/'
alias cddb='cd ~/Dropbox/'
alias cdda='cd /media/Data/'


# Key Bind
bindkey -v


# Change Directory
setopt auto_cd
setopt auto_pushd
cdpath=(~)
chpwd_functions=($chpwd_functions dirs)


# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt no_flow_control


# Prompt
setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt
autoload colors
colors
PROMPT="%(!.#.$) "
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "


# Comletion
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


# 展開
## --prefix=~/localというように「=」の後でも
## 「~」や「=コマンド」などのファイル名展開を行う。
setopt magic_equal_subst
## 拡張globを有効にする。
## glob中で「(#...)」という書式で指定する。
setopt extended_glob
## globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt mark_dirs


# 単語
## 「/」も単語区切りとみなす。
WORDCHARS=${WORDCHARS:s,/,,}
## 「|」も単語区切りとみなす。
## 2011-09-19
WORDCHARS="${WORDCHARS}|"


# tmux
function chpwd(){
  [ -n $TMUX ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD
}


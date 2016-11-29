# .zshrc
# @author Yousef Amar <yousef@amar.io>


# General
autoload -U colors && colors

setopt prompt_subst
source /home/amar/app/zsh-plugins/zsh-git-prompt/zshrc.sh
PROMPT='%2~ $(git_super_status)» '

export EDITOR="vim"
export VISUAL="vim"
export BROWSER="google-chrome-stable"
#"uzbl-browser"
export PAGER="less"
export II_PASSWORD="bashbash"

# Environment variables
PATH="$PATH:/home/amar/exec"
PATH="$PATH:/opt/cuda/bin"
PATH="$PATH:/home/amar/app/perl5/bin"
PATH="$PATH:/home/amar/.gem/ruby/2.3.0/bin"
export PATH
export PERL5LIB="/home/amar/app/perl5/lib/perl5${PERL5LIB+:}$PERL5LIB"
export PERL_LOCAL_LIB_ROOT="/home/amar/app/perl5${PERL_LOCAL_LIB_ROOT+:}$PERL_LOCAL_LIB_ROOT"
export PERL_MB_OPT="--install_base \"/home/amar/app/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/amar/app/perl5"
export LD_PRELOAD="/usr/local/src/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib/:/opt/cuda/lib64"
export WINEARCH=win32

# Aliases
function lcd { cd "$@"; pwd >! ~/.lcd; }

alias sudo='sudo '
alias cd='lcd'
alias cpp='rsync -pEogavzh --progress'
alias ..='lcd ../'
alias x='exit'
alias ls='ls --color'
alias la='ls -a --color'
alias ll='ls -l --color'
alias md='mkdir'
alias g='git'
alias v='vim'
alias sv='sudoedit'
alias vlc='vlc --no-color'
alias ci='xclip -selection clipboard'
alias co='xclip -selection clipboard -o'
alias py='python'
alias lt='/usr/bin/lt'
alias sp='spawn '
alias vv='spawn vim'
alias vvx='spawn vim && exit'
function vvcpp { spawn vim src/"$@".cpp include/"$@".h; }
alias t='tree'
alias top='htop'
alias uz='unzip'
alias mpv='mpv --input-file=/home/amar/.local/share/mpv/cmd-input'
function ipi { curl ipinfo.io/"$@" }
function cvii { converse-ii "$@" & }

alias nicks='cat /home/amar/.irssi/nicklistfifo'

# Initialisation
if [ -f ~/.lcd ]; then cd "$(cat ~/.lcd)"; fi

# Plugins
source /home/amar/app/zsh-plugins/z.sh
source /home/amar/app/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/amar/app/zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# More keybindings
autoload zkbd
#[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=10000000
setopt appendhistory extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle ':completion:*' auto-description 'specify %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+l:|=* r:|=*' '+r:|[._-.]=** r:|=**'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/amar/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

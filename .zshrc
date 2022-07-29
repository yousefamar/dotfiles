# .zshrc
# @author Yousef Amar <yousef@amar.io>


# General
autoload -U colors && colors

setopt prompt_subst
source $HOME/app/zsh-plugins/zsh-git-prompt/zshrc.sh
PROMPT='%2~ $(git_super_status)» '

export TERMINAL="kitty"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave-browser-stable"
#"uzbl-browser"
export PAGER="less"
export II_PASSWORD=""
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export HISTORY_IGNORE=" *"

# Environment variables
PATH="$PATH:$HOME/exec"
PATH="$PATH:/opt/cuda/bin"
PATH="$PATH:$HOME/app/perl5/bin"
PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"
PATH="$PATH:$HOME/.local/share/npm/bin"
PATH="$PATH:/opt/texlive/2019/bin/x86_64-linux"
PATH="$PATH:$HOME/app/git-fuzzy/bin"
PATH="$PATH:$HOME/.local/kitty.app/bin"
PATH="$PATH:/snap/bin"
PATH="$PATH:/usr/local/texlive/2020/bin/x86_64-linux"
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$HOME/.ebcli-virtual-env/executables"

export PATH
export PERL5LIB="$HOME/app/perl5/lib/perl5${PERL5LIB+:}$PERL5LIB"
export PERL_LOCAL_LIB_ROOT="$HOME/app/perl5${PERL_LOCAL_LIB_ROOT+:}$PERL_LOCAL_LIB_ROOT"
export PERL_MB_OPT="--install_base \"$HOME/app/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/app/perl5"
#export LD_PRELOAD="/usr/local/src/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib/:/opt/cuda/lib64"
export WINEARCH=win32
export ANDROID_HOME="$HOME/app/Android/Sdk"
PATH="$PATH:$ANDROID_HOME/tools"
PATH="$PATH:$ANDROID_HOME/platform-tools"
export _Z_DATA="$XDG_DATA_HOME/z/.z"
export NODE_PATH="$HOME/.local/share/npm/lib/node_modules"
#export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"

# Aliases
function lcd { cd "$@"; pwd >! $XDG_DATA_HOME/.lcd; }
function pdfs {
	for pdf in $@
	do
		mupdf $pdf &
	done
}

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
alias gf='git fuzzy'
alias v='nvim'
alias sv='sudoedit'
alias vlc='vlc --no-color'
alias ci='xclip -selection clipboard'
alias co='xclip -selection clipboard -o'
alias py='python'
#alias lt='/usr/bin/lt'
alias sp='spawn '
alias vv='spawn nvim'
alias vvl='TERMINAL="$TERMINAL -f Inconsolata:size=24" spawn nvim'
alias vvx='spawn nvim && exit'
function vvcpp { spawn vim src/"$@".cpp include/"$@".h; }
alias t='tree'
alias top='htop'
alias uz='unzip'
alias mpv='mpv --input-file=$HOME/.local/share/mpv/cmd-input'
function ipi { curl ipinfo.io/"$@" }
function cvii { converse-ii "$@" & }
alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias srv='/bin/sv'
alias pdfs='pdfs '

alias nicks='cat $HOME/.irssi/nicklistfifo'
alias icat="kitty +kitten icat"

# Initialisation
if [ -f $XDG_DATA_HOME/.lcd ]; then cd "$(cat $XDG_DATA_HOME/.lcd)"; fi

# Plugins
source $HOME/app/zsh-plugins/z.sh
source $HOME/app/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/app/zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# More keybindings
unsetopt MULTIBYTE
autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

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
HISTSIZE=10000000
SAVEHIST=1000000000
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
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Created by `userpath` on 2020-06-21 19:44:45
export PATH="$PATH:/home/amar/.local/bin"
#export XDG_DATA_DIRS="${XDG_DATA_DIRS}:/var/lib/snapd/desktop:/usr/share/applications"

export GDK_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=2

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/amar/proj/ef/krew/lambdas/aws/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/amar/proj/ef/krew/lambdas/aws/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/amar/proj/ef/krew/lambdas/aws/node_modules/tabtab/.completions/sls.zsh ]] && . /home/amar/proj/ef/krew/lambdas/aws/node_modules/tabtab/.completions/sls.zsh
source /home/amar/.config/broot/launcher/bash/br

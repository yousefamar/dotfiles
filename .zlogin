# .zlogin
# @author Yousef Amar   <yousef@amar.io>
# @author Sorin Ionescu <sorin.ionescu@gmail.com>

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Scripts on startup

#archey
echo "Welcome Yousef, master of space and time!\n"
#dropbox start
setxkbmap -layout gb -option 'ctrl:nocaps' -option 'terminate:ctrl_alt_bksp'
if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi
[[ -z "$DISPLAY" && "$(fgconsole)" -eq 1 ]] && exec startx -bs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

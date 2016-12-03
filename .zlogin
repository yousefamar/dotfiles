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
sudo chmod 777 /sys/class/backlight/intel_backlight/brightness
#dropbox start
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -bs

setxkbmap -layout gb -option 'ctrl:nocaps'
if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi
#sh ~/.fehbg &
#unclutter -grab &
xcompmgr -c &
exec i3 -V >> ~/.config/i3/i3log 2>&1

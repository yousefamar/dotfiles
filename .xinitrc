setxkbmap -layout de -variant mac -option 'ctrl:nocaps'
if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi
sh ~/.fehbg &
#unclutter -grab &
exec i3 -V >> ~/.i3/i3log 2>&1

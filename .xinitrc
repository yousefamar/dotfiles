setxkbmap -layout gb -option 'ctrl:nocaps' -option 'terminate:ctrl_alt_bksp'
if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi
export GTK_IM_MODULE="xim"
#sudo chmod 777 /sys/class/backlight/intel_backlight/brightness
#sh ~/.fehbg &
#unclutter -grab &
#xcompmgr -c &
exec i3 -V >> ~/.config/i3/i3log 2>&1

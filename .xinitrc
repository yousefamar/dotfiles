setxkbmap -layout gb -option 'ctrl:swapcaps' -option 'compose:lctrl' -option 'terminate:ctrl_alt_bksp'
#xrandr --newmode  "3200x1800"  492.00  3200 3456 3800 4400  1800 1803 1808 1865 -hsync +vsync
#xrandr --addmode VGA-1 3200x1800
#xrandr --newmode  "1366x768"  85.500  1366 1494 1624 1798 768 770 776 795 -hsync +vsync
#xrandr --addmode VGA-1 1366x768
#xrandr --output VGA-1 --mode 3200x1800 --dpi 138
#xrandr --output VGA-1 --mode 1366x768  --dpi 69
xset +fp /home/amar/.local/share/fonts
xset fp rehash

if xrandr | grep 'DP-4 connected'
then
	xrandr --output eDP-1-1 --primary --auto --output DP-4 --auto --scale 2.5x2.5 --dpi 96 --right-of eDP-1-1
	# Calibrate touch screen
	xinput map-to-output 14 eDP-1-1
fi

xinput set-prop "DLL096D:01 06CB:CDE6 Touchpad" "Synaptics Move Speed" 1.000000, 10.00000, 0.050000, 0.000000

if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
	eval `dbus-launch --sh-syntax --exit-with-session`
	export DBUS_SESSION_BUS_ADDRESS
	export DBUS_SESSION_BUS_PID
	export DBUS_SESSION_BUS_WINDOWID
	echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

exec bspwm >> ~/.config/bspwm/log 2>&1
#exec dbus-launch --exit-with-x11 bspwm
#exec dbus-run-session bspwm

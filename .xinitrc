setxkbmap -layout gb -option 'ctrl:nocaps' -option 'terminate:ctrl_alt_bksp'
xrandr --newmode  "3200x1800"  492.00  3200 3456 3800 4400  1800 1803 1808 1865 -hsync +vsync
xrandr --addmode VGA-1 3200x1800
xrandr --newmode  "1366x768"  85.500  1366 1494 1624 1798 768 770 776 795 -hsync +vsync
xrandr --addmode VGA-1 1366x768
xrandr --output VGA-1 --mode 3200x1800 --dpi 138
#xrandr --output VGA-1 --mode 1366x768  --dpi 69
sxhkd &
exec bspwm >> ~/.config/bspwm/log 2>&1

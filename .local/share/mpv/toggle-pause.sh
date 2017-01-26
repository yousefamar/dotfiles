#!/bin/sh
PAUSE_STATE_FILE=/home/amar/.local/share/mpv/pause-state.txt
touch "$PAUSE_STATE_FILE"
PAUSE=$(cat "$PAUSE_STATE_FILE")
PAUSE=$(if [ "$PAUSE" = "true" ]; then echo "false"; else echo "true"; fi)
echo '{ "command": ["set_property", "pause", '"$PAUSE"'] }' > /home/amar/.local/share/mpv/cmd-input
echo "$PAUSE" > "$PAUSE_STATE_FILE"

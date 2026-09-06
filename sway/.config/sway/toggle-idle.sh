#!/usr/bin/env sh

if pgrep -x swayidle >/dev/null; then
	pkill -x swayidle
	notify-send -u low -t 2000 "Idle Management" "swayidle disabled"
else
	# Adjust your timeouts, lock commands, and DPMS actions below
	swayidle -w \
		timeout 300 'swaylock -f -c 000000' \
		timeout 600 'swaymsg "output * power off"' \
		resume 'swaymsg "output * power on"' \
		before-sleep 'swaylock -f -c 000000' &
	notify-send -u low -t 2000 "Idle Management" "swayidle enabled"
fi

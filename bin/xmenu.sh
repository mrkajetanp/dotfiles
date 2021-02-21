#!/bin/sh

cat <<EOF | xmenu | sh &
Applications
	Chromium	chromium
	gThumb	gthumb
Alacritty	alacritty
st		st

Restart sddm	rc-service sddm restart
Shutdown		loginctl poweroff
Reboot			loginctl reboot
EOF

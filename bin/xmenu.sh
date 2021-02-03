#!/bin/sh

cat <<EOF | xmenu | sh &
Applications
	Chromium	chromium
	gThumb	gthumb
Alacritty	alacritty
st		st

Terminate user		loginctl terminate-user kajetan
Shutdown		loginctl poweroff
Reboot			loginctl reboot
EOF

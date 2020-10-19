#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -c /home/kajetan/.config/polybar/config_bspwm topbar -r &
polybar -c /home/kajetan/.config/polybar/config_bspwm bottombar -r &
